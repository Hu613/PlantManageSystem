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

function getpest(req, res) {
    const query = `SELECT pestid, pestname, pestpicture FROM pest`;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching pest: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const pest = results.map(pest => ({
          ...pest
        }));
        res.json(pest);
      }
    });
  }
  
  function getPestPage(req, res) {
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
    getpest,
    getPestPage,
  };
  
   
   
 