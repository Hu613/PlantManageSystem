const express = require('express');
const router = express.Router();
const tagControl = require('../router_handler/tagcontrol');



router.get('/gettag', tagControl.gettag);

router.get('/getPlanttypePage/:tagid', tagControl.getPlanttypePage);

module.exports = router;
