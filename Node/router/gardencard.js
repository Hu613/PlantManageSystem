const express = require('express');
const router = express.Router();
const gardencardControl = require('../router_handler/gardencardcontrol');


router.post('/createOrUpdateGardenCard', gardencardControl.createOrUpdateGardenCard);

module.exports = router;
