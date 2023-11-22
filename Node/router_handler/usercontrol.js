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
    const entertime = 0;

    const insertQuery = `
      INSERT INTO share (shareid, title, description, sharepicture, userId, entertime)
      VALUES (?, ?, ?, ?, ?, ?)`;
  

    db.query(insertQuery, [shareid, title, description, sharePicture, userId, entertime], (err, results) => {
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

  function getuserpage(req, res) {
    const userId = req.params.userId;
    console.log('userid', req.params.userId);
    const query = `
      SELECT id, username, useravatar
      FROM user
      WHERE id = ?`;
  
    db.query(query, [userId], (err, results) => {
      if (err) {
        console.error('Error fetching user:', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        if (results.length > 0) {
          const user = results[0];
          const userData = {
            userId: user.id,
            username: user.username,
            useravatar: `http://localhost:3000/${user.useravatar}`
          };
          console.log('userdata:', userData);
          res.json(userData);
        } else {
          res.status(404).json({ error: 'Cannot find user with the provided id' });
        }
      }
    });
  }

  function collect(req, res) {
    const { shareid ,userId } = req.body;
    console.log("shareid and userId", req.body);
    const collectionid = uuid();

    const insertQuery = `
      INSERT INTO collection (collectionid, shareid, userId)
      VALUES (?, ?, ?)`;
  

    db.query(insertQuery, [collectionid,shareid, userId], (err, results) => {
      if (err) {
        console.error('Error inserting into database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Collect successfully', collectionid: collectionid });
      }
    });
  }

  function deleteshare(req, res) {
    const { shareid } = req.body;
    console.log("shareid", req.body);

    const deleteQuery = `
      DELETE FROM share WHERE shareid=?`;
  

    db.query(deleteQuery, [shareid], (err, results) => {
      if (err) {
        console.error('Error delete from database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Delete successfully'});
      }
    });
  }

  function deletecollect(req, res) {
    const { shareid } = req.body;
    console.log("shareid", req.body);

    const deleteQuery = `
      DELETE FROM collection WHERE shareid=?`;
  

    db.query(deleteQuery, [shareid], (err, results) => {
      if (err) {
        console.error('Error delete from database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Delete successfully'});
      }
    });
  }

  function concern(req, res) {
    const { concernuserId ,userId, concernusername, concernuseravatar } = req.body;
    console.log("concernuserId and userId", req.body);
    const concernid = uuid();

    const insertQuery = `
      INSERT INTO concern (concernid, userId, concernuserId, concernusername, concernuseravatar)
      VALUES (?, ?, ?, ?, ?)`;
  

    db.query(insertQuery, [concernid,userId, concernuserId, concernusername, concernuseravatar], (err, results) => {
      if (err) {
        console.error('Error inserting into database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Concern successfully', Concernid: concernid });
      }
    });
  }

  function deleteconcern(req, res) {
    const { concernuserId } = req.body;
    console.log("concernuserId", req.body);

    const deleteQuery = `
      DELETE FROM concern WHERE concernuserId=?`;
  

    db.query(deleteQuery, [concernuserId], (err, results) => {
      if (err) {
        console.error('Error delete from database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Delete successfully'});
      }
    });
  }

  function checkconcern(req, res) {
    const { userId, concernuserId } = req.params;
    const query = `
      SELECT COUNT(*) AS count
      FROM concern
      WHERE userId = ? AND concernuserId = ?`;
  
    db.query(query, [userId, concernuserId], (err, results) => {
      if (err) {
        console.error('Error querying database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        const isConcerned = results[0].count > 0;
        res.json({ isConcerned });
      }
    });
  }

  function getUserConcern(req, res) {
    const { userId } = req.params;
    console.log('userId',userId);
    const concernQuery = `SELECT c.concernid, c.concernuserId, c.concernusername, c.concernuseravatar FROM user_concern uc JOIN concern c ON uc.concernid = c.concernid WHERE uc.id = ?`;
    db.query(concernQuery, [userId], (err, concerns) => {
      if (err) {
        res.status(500).json({ error: 'Database error in fetching concerns' });
        return;
      }
      res.json({ concerns });
      console.log('concernuserdata', concerns);
    });
  }

  
  
  module.exports = {
    login,
    register,
    createExperience,
    incrementEnterTime,
    getuserpage,
    collect,
    deleteshare,
    deletecollect,
    concern,
    deleteconcern,
    checkconcern,
    getUserConcern,
  };
  
   
   
 