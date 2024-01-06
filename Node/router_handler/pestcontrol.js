const db = require('../common/db');


function getpest(req, res) {//get all pests information for the front-end to display the card.
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
  
  function getPestPage(req, res) {//get the pest information for the front-end to display the pestpage.
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
  
   
   
 