const db = require('../common/db');

function getsupplier(req, res) { //get all suppliers information for the front-end to display the cards.
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
  
  function getplantkitsupplier(req, res) {//get plant kit suppliers information for the front-end to display the cards.
    const query = `SELECT supplierid, suppliername, description, supplierlink FROM supplier WHERE suppliertype = 'plantkit'`;
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
  function getpestsupplier(req, res) {//get pest control suppliers information for the front-end to display the cards.
    const query = `SELECT supplierid, suppliername, description, supplierlink FROM supplier WHERE suppliertype = 'pest'`;
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
  function getplanttypesupplier(req, res) {//get planttype suppliers information for the front-end to display the cards.
    const query = `SELECT supplierid, suppliername, description, supplierlink FROM supplier WHERE suppliertype = 'planttype'`;
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
    getplanttypesupplier,
    getpestsupplier,
    getplantkitsupplier
  };
  
   
   
 