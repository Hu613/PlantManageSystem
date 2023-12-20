const express = require('express');
const session = require('express-session');
const cors = require('cors');

const app = express();


//set middleware 
app.use(cors());
app.use(session({
  secret: 'secret_key', 
  resave: false,
  saveUninitialized: true, 
  cookie: { secure: false }
}));

app.use(express.json());  //use json middleware to parse the request body

//set route
app.use('/user', require('./router/user'))
app.use('/social', require('./router/social'))
app.use('/comment', require('./router/comment'))
app.use('/tag', require('./router/tag'))
app.use('/plant', require('./router/plant'))
app.use('/pest', require('./router/pest'))
app.use('/supplier', require('./router/supplier'))
app.use('/garden', require('./router/garden'))
app.use('/search', require('./router/search'))
app.use('/gardencard', require('./router/gardencard'))

//set static file directory
app.use('/uploads', express.static('uploads'));


app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Wrong!');
});


app.listen(3000, () => {
    console.log('Server running on http://localhost:3000/');
});
