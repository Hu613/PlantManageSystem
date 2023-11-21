const express = require('express');
const router = express.Router();
const pestControl = require('../router_handler/pestcontrol');



router.get('/getpest', pestControl.getpest);

router.get('/getPestPage/:pestid', pestControl.getPestPage);

module.exports = router;
