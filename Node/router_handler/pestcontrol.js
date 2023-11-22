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
    const pestid = req.params.pestid;
  
    const pestQuery = `SELECT pestid, pestname, description, pestcontrol, prevention, pestpicture FROM pest WHERE pestid = ?`;
    db.query(pestQuery, [pestid], (err, pestData) => {
      const pest = pestData[0];
      const supplierQuery = `
        SELECT s.supplierid, s.suppliername, s.description, s.supplierlink
        FROM pest_supplier ps 
        JOIN supplier s ON s.supplierid = ps.supplierid
        WHERE ps.pestid = ?`;
      db.query(supplierQuery, [pestid], (err, suppliers) => {
        if (err) {
          res.status(500).json({ error: 'Database error in fetching suppliers' });
          return;
        }

        const plantQuery = `
          SELECT p.plantid, p.plantname, p.plantpicture
          FROM plant_pest pp
          JOIN plant p ON p.plantid = pp.plantid
          WHERE pp.pestid = ?`;
        db.query(plantQuery, [pestid], (err, plants) => {
          if (err) {
            res.status(500).json({ error: 'Database error in fetching plants' });
            return;
          }
  
          const pestData = {
            pestid: pest.pestid,
            pestname: pest.pestname,
            description: pest.description,
            pestcontrol: pest.pestcontrol,
            prevention: pest.prevention,
            pestpicture: pest.pestpicture,
            plants: plants,
            suppliers: suppliers
          };
          res.json(pestData);
          console.log(pestData);
        });
      });
    });
  }

  module.exports = {
    getpest,
    getPestPage,
  };
  
   
   
 