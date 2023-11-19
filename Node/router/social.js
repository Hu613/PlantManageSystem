const express = require('express');
const router = express.Router();
const socialControl = require('../router_handler/socialcontrol');



router.get('/getsocial', socialControl.getsocial);

router.get('/gethotsocial', socialControl.gethotsocial);

router.get('/getnewsocial', socialControl.getnewsocial);

router.get('/getusersocial/:userId', socialControl.getusersocial);

router.get('/getsocialpage/:shareid', socialControl.getsocialpage);

router.get('/getusercollect/:userId', socialControl.getusercollect);

module.exports = router;
