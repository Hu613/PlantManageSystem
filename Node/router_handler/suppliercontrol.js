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

function getsupplier(req, res) {
    const query = `SELECT supplierid, suppliername, LEFT(description, 30) as description, supplierlink FROM supplier`;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching supplier: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const supplier = results.map(supplier => ({
          ...supplier
        }));
        res.json(supplier);
    
      }
    });
  }
  
  module.exports = {
    getsupplier,
  };
  
   
   
 