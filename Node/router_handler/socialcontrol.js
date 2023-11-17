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

function getsocial(req, res) {
    const query = `SELECT shareid, title, LEFT(description, 100) as description, sharepicture FROM share`;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching share: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const share = results.map(share => ({
          ...share,
          image: share.sharepicture.split(';')[0] 
        }));
        res.json(share);
      }
    });
  }

  

  
  module.exports = {
    getsocial
  };
  
   
   
 