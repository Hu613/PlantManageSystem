const db = require('../common/db');
const { uuid } = require('../common/uuid');

db.getConnection((err, connection) => {
  if(err) {
    console.error('Error connecting to database: ', err);
  } else {
    connection.ping(error => {
      if (error) {
        console.error('Error pinging database: ', error);
      } else {
        console.log('Connected to database!');
      }
      connection.release();
    });
  }
});

function getplant(req, res) {
    const query = `SELECT plantid, plantname, plantpicture FROM plant`;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching plant: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const plant = results.map(plant => ({
          ...plant
        }));
        res.json(plant);
      }
    });
  }
  function incrementPlantEnterTime(req, res) {
    const { plantid } = req.params; 
  
    const updateQuery = `
      UPDATE plant SET entertime = entertime + 1 WHERE plantid = ?`;
  
    db.query(updateQuery, [plantid], (err, results) => {
      if (err) {
        console.error('Error updating database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Enter time incremented successfully' });
      }
    });
  }
  
  function getPlantPage(req, res) {
    const plantid = req.params.plantid;
    console.log('plantid', req.params.plantid);
    
   
    const query = `
      SELECT p.plantid, p.plantname, p.description, p.planthelp, p.plantpicture, pe.pestid 
      FROM plant p
      JOIN pest pe ON p.pestid = pe.pestid
      WHERE p.plantid = ?
    `;
  
    db.query(query, [plantid], (err, results) => {
      if (err) {
        console.error('Error fetching share:', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        if (results.length > 0) {
          const plant = results[0];
          const plantData = {
            plantid: plant.plantid,
            plantname: plant.plantname,
            description: plant.description,
            planthelp: plant.planthelp,
            plantpicture: plant.plantpicture,
            entertime: plant.entertime,
            pestid: plant.pestid,
          };
          console.log('plantData:', plantData);
          res.json(plantData);
         
        } else {
          res.status(404).json({ error: 'Cannot find share with the provided id' });
        }
      }
    });
  }
  module.exports = {
    getplant,
    incrementPlantEnterTime,
    getPlantPage,
  };
  
   
   
 