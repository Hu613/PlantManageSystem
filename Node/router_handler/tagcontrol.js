const db = require('../common/db');

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

function gettag(req, res) {
    const query = `SELECT tagid, title, tagpicture FROM tag`;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching tag: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const tag = results.map(tag => ({
          ...tag
        }));
        res.json(tag);
      }
    });
  }

  function getPlanttypePage(req, res) {
    const tagid = req.params.tagid;
  
    const tagQuery = `SELECT tagid, title, description, adviselink, tagpicture FROM tag WHERE tagid = ?`;
    db.query(tagQuery, [tagid], (err, tagData) => {
      const tag = tagData[0];
      const plantQuery = `
        SELECT p.plantid, p.plantname, p.plantpicture, p.userplantpicture
        FROM tag_plant tp 
        JOIN plant p ON p.plantid = tp.plantid
        WHERE tp.tagid = ?`;
      db.query(plantQuery, [tagid], (err, plants) => {
        if (err) {
          res.status(500).json({ error: 'Database error in fetching plants' });
          return;
        }
  
        const supplierQuery = `
          SELECT s.supplierid, s.suppliername, s.description, s.supplierlink
          FROM tag_supplier ts
          JOIN supplier s ON s.supplierid = ts.supplierid
          WHERE ts.tagid = ?`;
        db.query(supplierQuery, [tagid], (err, supplierResults) => {
          if (err) {
            res.status(500).json({ error: 'Database error in fetching suppliers' });
            return;
          }
  
          const tagData = {
            tagid: tag.tagid,
            title: tag.title,
            description: tag.description,
            adviselink: tag.adviselink,
            tagpicture: tag.tagpicture,
            plants: plants,
            suppliers: supplierResults
          };
          res.json(tagData);
        });
      });
    });
  }
  
  

  module.exports = {
    gettag,
    getPlanttypePage,
  };
  
   
   
 