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

  
   function getsocialpage(req, res) {
  const shareid = req.params.shareid;
  console.log('shareid', req.params.shareid);
  
 
  const query = `
    SELECT s.shareid, s.title, s.description, s.sharepicture, s.userId, s.entertime, s.createtime, u.username, u.useravatar 
    FROM share s
    JOIN user u ON s.userId = u.id
    WHERE s.shareid = ?
  `;

  db.query(query, [shareid], (err, results) => {
    if (err) {
      console.error('Error fetching share:', err);
      res.status(500).json({ error: 'Internal server error' });
    } else {
      if (results.length > 0) {
        const share = results[0];
        if (share.sharepicture) {
          share.images = share.sharepicture.split(';').map(pic => `http://localhost:3000/${pic}`);
        } else {
          share.images = [];
        }

        const shareData = {
          shareid: share.shareid,
          title: share.title,
          description: share.description,
          images: share.images,
          userId: share.userId,
          entertime: share.entertime,
          createtime: share.createtime,
          username: share.username,
          useravatar: `http://localhost:3000/${share.useravatar}`
        };
        console.log('shareData:', shareData);
        res.json(shareData);
       
      } else {
        res.status(404).json({ error: 'Cannot find share with the provided id' });
      }
    }
  });
}

  
  module.exports = {
    getsocial,
    getsocialpage
  };
  
   
   
 