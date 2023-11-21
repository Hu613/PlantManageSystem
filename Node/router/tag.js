const express = require('express');
const router = express.Router();
const tagControl = require('../router_handler/tagcontrol');



router.get('/gettag', tagControl.gettag);



module.exports = router;
