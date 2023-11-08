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

  function register(req, res) {
    const { username, email, password } = req.body;
    console.log('Received register request:', req.body);
    const checkQuery = `SELECT * FROM user WHERE email = ?`;
    db.query(checkQuery, [email], (err, results) => {
      if (err) {
        console.error('Error querying database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        if (results.length > 0) {
          res.status(400).json({ error: 'Email already registered' });
        } else {
          const id = uuid();
          const insertQuery = `INSERT INTO user (id, username, password, email) VALUES (?, ?, ?, ?)`;
          db.query(insertQuery, [id, username, password, email], (err) => {
            if (err) {
              console.error('Error creating user: ', err);
              res.status(500).json({ error: 'Internal server error' });
            } else {
              req.session.userId = id;
              res.status(200).json({ message: 'Registration successful', userId: id });
            }
          });
        }
      }
    });
  }
  
  function login(req, res) {
    const { email, password } = req.body;
    console.log('Received login request:', req.body);
    const query = `SELECT * FROM user WHERE email = ?`;
    db.query(query, [email], (err, results) => {
      if (err) {
        console.error('Error querying database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        if (results.length === 0) {
          res.status(401).json({ error: 'Invalid email or password' });
        } else {
          const user = results[0];
          if (password === user.password) {
            req.session.userId = user.id;
            req.session.username = user.username;
            res.status(200).json({ message: 'Login successful', userId: user.id, username: user.username });
          } else {
            res.status(401).json({ error: 'Invalid email or password' });
          }
        }
      }
    });
  }
  

  module.exports = {
    login,
    register,
  };