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

function createOrUpdateGardenCard(req, res) {
  const { position, plantid, gardenid } = req.body;
  const gardencardid = uuid();

  const query = `INSERT INTO gardencard (gardencardid, plantid, position, gardenid) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE plantid = VALUES(plantid), position = VALUES(position), gardenid = VALUES(gardenid)`;

  db.query(query, [gardencardid, plantid, position, gardenid], (err, result) => {
    if (err) {
      console.error('Error creating/updating gardencard:', err);
      res.status(500).json({ error: 'Database error in creating/updating gardencard' });
    } else {
      res.status(200).json({ message: 'Garden card created/updated successfully', gardencardid });
    }
  });
}


  

  

  module.exports = {
    createOrUpdateGardenCard,

  };
  
   
   
 