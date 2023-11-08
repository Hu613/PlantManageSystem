const express = require('express');
const bodyParser = require('body-parser');
const multer = require('multer');
const session = require('express-session');
const userRouter = require('./router/user');

const app = express();


app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/'); 
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now());
  }
});

const upload = multer({ storage: storage });


app.use(session({
  secret: 'secret_key', 
  resave: false,
  saveUninitialized: true, 
}));


app.use('/user', require('./router/user'))

app.use('/uploads', express.static('uploads'));

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000/');
});
