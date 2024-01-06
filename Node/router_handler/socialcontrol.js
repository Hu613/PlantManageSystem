const db = require('../common/db');

function getsocial(req, res) {//get all shares information for the front-end to display the cards.
    const query = `SELECT shareid, title, LEFT(description, 30) as description, sharepicture FROM share`;
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

  
   function getsocialpage(req, res) {//get the shares information for the front-end to display the sharepage.
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

function getnewsocial(req, res) {//get the new shares information for the front-end to display the cards.
  const query = `SELECT shareid, title, LEFT(description, 30) as description, sharepicture FROM share
                 ORDER BY createtime DESC LIMIT 4`;
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

function gethotsocial(req, res) {//get hot shares information for the front-end to display the cards.
  const query = `SELECT shareid, title, LEFT(description, 30) as description, sharepicture FROM share 
                 ORDER BY entertime DESC LIMIT 4`;//select shareid ,title, description only 30, sharepicutre from share table, limit only 4 records.
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching share: ', err);
      res.status(500).json({ error: 'Internal server error' });
    } else {
    
      const share = results.map(share => ({
        ...share,
        image: share.sharepicture.split(';')[0] 
      }));//Modify image to be the first of the sharepicture string,and send share img to front-end
      res.json(share);
    }
  });
}

function getusersocial(req, res) {//get the current logged in user's posted shares information for the front-end to display the cards.
  const userId = req.params.userId;
  const query = `SELECT shareid, title, LEFT(description, 30) as description, sharepicture, userId FROM share WHERE userId = ?`;
  db.query(query, [userId],(err, results) => {
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


function getusercollect(req, res) {//get current logged in user's collect shares information for the front-end to display the cards.
  const userId = req.params.userId;
  const query = `SELECT s.shareid, s.title, LEFT(s.description, 30) as description, s.sharepicture, s.createtime FROM share s
    JOIN collection c ON s.shareid = c.shareid
    WHERE c.userId = ?`;
  db.query(query, [userId],(err, results) => {
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
    getsocial,
    getsocialpage,
    gethotsocial,
    getnewsocial,
    getusersocial,
    getusercollect,
  };
  
   
   
 