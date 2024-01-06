const db = require('../common/db');
const { uuid } = require('../common/uuid');


function createOrUpdateGardenCard(req, res) {//user design the garden layout functions by creating or updating the position's plant card
  const { position, plantid, gardenid } = req.body;
  const gardencardid = uuid();

  const query = `INSERT INTO gardencard (gardencardid, plantid, position, gardenid) VALUES (?, ?, ?, ?) 
  ON DUPLICATE KEY UPDATE plantid = VALUES(plantid), position = VALUES(position), gardenid = VALUES(gardenid)`;//Insert the data into gardencard to create a new record. also update plantid if gardenid already exists in the table, position river gardenid.

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
  
   
   
 