const express = require('express');
const router = express.Router();
const userControl = require('../router_handler/usercontrol');
const multer = require('multer');


const upload = multer({ dest: 'uploads/' });

router.post('/login', userControl.login);

router.post('/register', upload.single('avatar'), userControl.register);

router.post('/createExperience', upload.array('sharepictures',5), userControl.createExperience);

router.post('/incrementEnterTime/:shareid/enter', userControl.incrementEnterTime);

router.get('/getuserpage/:userId', userControl.getuserpage);

router.post('/collect', userControl.collect);

router.post('/deleteshare', userControl.deleteshare);

router.post('/deletecollect', userControl.deletecollect);

module.exports = router;
