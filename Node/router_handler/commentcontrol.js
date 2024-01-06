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
});//test for a successful connection to the database

function addcomment(req,res){//add comment to the sharepage function.
    const {userId, pageId, content} = req.body;
    console.log('Comment data',req.body);
    if(!userId || !pageId || !content){
        return res.status(400).json({error: 'Error! Some data miss!'})
    }
   
    const id = uuid();
    const insertQuery = `INSERT INTO comment (id, userId, pageId, content) VALUES (?, ?, ?, ?)`;
    db.query(insertQuery, [id, userId, pageId, content], (err, results) => {
        if (err) {
          console.error('Error inserting comment into database: ', err);
          res.status(500).json({ error: 'Internal server error' });
        } else {
          res.status(200).json({ message: 'Comment added successfully', commentId: id });
        }
      });
    }
    
    function getCommentsByPageId(req, res) {//get the current sharepage's comments.
        const pageId = req.params.pageId;
        const query = `
          SELECT c.id, c.userId, c.pageId, c.content, c.createtime, u.username, u.useravatar 
          FROM comment c
          JOIN user u ON c.userId = u.id
          WHERE c.pageId = ?
        `;
      
        db.query(query, [pageId], (err, results) => {
          if (err) {
            console.error('Error fetching comments:', err);
            res.status(500).json({ error: 'Internal server error' });
          } else {
            res.status(200).json({ comments: results.map(comment => ({
              ...comment,
              useravatar: `http://localhost:3000/${comment.useravatar}`
            })) });
          }
        });
      }

module.exports = {
    addcomment,
    getCommentsByPageId
  };