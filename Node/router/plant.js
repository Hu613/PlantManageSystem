const express = require('express');
const router = express.Router();
const plantControl = require('../router_handler/plantcontrol');



router.get('/getplant', plantControl.getplant);

router.get('/getPlantPage/:plantid', plantControl.getPlantPage);

router.post('/incrementPlantEnterTime/:plantid/enter', plantControl.incrementPlantEnterTime);

module.exports = router;
