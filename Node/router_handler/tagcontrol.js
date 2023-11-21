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

  

  module.exports = {
    gettag,
  };
  
   
   
 