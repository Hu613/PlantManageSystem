const express = require('express');
const router = express.Router();
const userControl = require('../router_handler/usercontrol');
const multer = require('multer');


const upload = multer({ dest: 'uploads/' });

router.post('/login', userControl.login);

router.post('/register', upload.single('avatar'), userControl.register);

module.exports = router;
