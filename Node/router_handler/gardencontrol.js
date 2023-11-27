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


function createGarden(req, res) {
    const { userId, gardenname } = req.body;
    const gardenid = uuid();
    console.log('garden data', req.body);
    const insertQuery = `
      INSERT INTO garden (gardenid, gardenname, userid)
      VALUES (?, ?, ?)`;

    db.query(insertQuery, [gardenid, gardenname, userId], (err, result) => {
      if (err) {
        console.error('Database error cause of', err);
        res.status(500).json({ error: 'Database error in creating garden' });
      } else {
        res.json({ message: 'Garden created successfully', gardenid: gardenid });
      }
    });
}


  function getgarden(req, res) {
    const userId = req.params.userId;
    const query = `SELECT gardenid, gardenname, userId FROM garden WHERE userId = ?`;
    db.query(query, [userId],(err, results) => {
      if (err) {
        console.error('Error fetching garden: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const garden = results.map(garden => ({
          ...garden
        }));
        res.json(garden);
      }
    });
  }


  function getGardenPage(req, res) {
    const gardenId = req.params.gardenid;
  
    const query = `
      SELECT gc.gardencardid, gc.plantid, gc.position, p.plantname, p.userplantpicture
      FROM gardencard gc
      LEFT JOIN plant p ON gc.plantid = p.plantid
      WHERE gc.gardenid = ?`;
  
    db.query(query, [gardenId], (err, results) => {
      if (err) {
        console.error('Error fetching garden cards: ', err);
        res.status(500).json({ error: 'Internal server error' });
        return;
      }
  
      const cards = results.map(row => ({
        gardencardid: row.gardencardid,
        plantid: row.plantid,
        plantname: row.plantname,
        userplantpicture: row.userplantpicture,
        position: row.position
      }));
  
      res.json({ cards });
      console.log(cards);
    });
  }
  
  function deletegarden(req, res) {
    const { gardenid } = req.body;
    console.log("garden", req.body);
  
    const deleteQuery = `
      DELETE FROM garden WHERE gardenid=?`;
  
  
    db.query(deleteQuery, [gardenid], (err, results) => {
      if (err) {
        console.error('Error delete from database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Delete successfully'});
      }
    });
  }




  module.exports = {
    createGarden,
    getgarden,
    getGardenPage,
    deletegarden
  
  };
  
   
   
 