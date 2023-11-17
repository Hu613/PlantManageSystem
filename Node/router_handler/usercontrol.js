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
    const { username, email, password, lat, lon} = req.body;
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
          const picture = req.file;
          if(!picture){
            return res.status(400).json({error: 'No file upload'});
          }
          const useravatar = picture.path;
          const insertQuery = `INSERT INTO user (id, username, password, email,useravatar,lat,lon) VALUES (?, ?, ?, ?, ?, ?, ?)`;
          db.query(insertQuery, [id, username, password, email,useravatar,lat,lon], (err) => {
            if (err) {
              console.error('Error creating user: ', err);
              res.status(500).json({ error: 'Internal server error' });
            } else {
              req.session.userId = id;
              res.status(200).json({ message: 'Registration successful', userId: id });
              console.log("userId", req.userid)
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
            req.session.useravatar = user.useravatar;
            req.session.lat = user.lat;
            req.session.lon = user.lon;
            res.status(200).json({ message: 'Login successful', userId: user.id, username: user.username, useravatar: user.useravatar , lat: user.lat, lon: user.lon});
          } else {
            res.status(401).json({ error: 'Invalid email or password' });
          }
        }
      }
    });
  }
   

  function createExperience(req, res) {
    const { title, description,userId } = req.body;
    console.log("user session userId", req.body);
    const shareid = uuid();
  
    const sharePicture = req.files.map(file => file.path).join(';'); 
    const createtime = new Date().toISOString().slice(0, 19).replace('T', ' '); 
    const entertime = 0;

    const insertQuery = `
      INSERT INTO share (shareid, title, description, sharepicture, userId, entertime, createtime)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `;
  

    db.query(insertQuery, [shareid, title, description, sharePicture, userId, entertime, createtime], (err, results) => {
      if (err) {
        console.error('Error inserting into database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Experience created successfully', shareid: shareid });
      }
    });
  }
  
  function incrementEnterTime(req, res) {
    const { shareid } = req.params; 
  
    const updateQuery = `
      UPDATE share SET entertime = entertime + 1 WHERE shareid = ?
    `;
  
    db.query(updateQuery, [shareid], (err, results) => {
      if (err) {
        console.error('Error updating database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Enter time incremented successfully' });
      }
    });
  }

  
  module.exports = {
    login,
    register,
    createExperience,
    incrementEnterTime,
  };
  
   
   
 