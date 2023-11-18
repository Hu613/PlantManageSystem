const express = require('express');
const router = express.Router();
const socialControl = require('../router_handler/socialcontrol');



router.get('/getsocial', socialControl.getsocial);

router.get('/getsocialpage/:shareid', socialControl.getsocialpage);

module.exports = router;
