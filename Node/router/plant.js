const express = require('express');
const router = express.Router();
const plantControl = require('../router_handler/plantcontrol');



router.get('/getplant', plantControl.getplant);

router.get('/getPlantPage/:plantid', plantControl.getPlantPage);


module.exports = router;
