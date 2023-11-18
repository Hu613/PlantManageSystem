const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const cors = require('cors');

const app = express();



app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.use(session({
  secret: 'secret_key', 
  resave: false,
  saveUninitialized: true, 
  cookie: { secure: false }
}));

app.use(express.json()); 

app.get('/session', function(req, res){
  res.json({userId: req.session.userId, username: req.session.username, useravator: user.useravator, lat: user.lat, lon: user.lon});
});

app.use('/user', require('./router/user'))
app.use('/social', require('./router/social'))
app.use('/comment', require('./router/comment'))
app.use('/uploads', express.static('uploads'));


app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Wrong！');
});


app.listen(3000, () => {
    console.log('Server running on http://localhost:3000/');
});
