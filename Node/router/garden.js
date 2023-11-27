const express = require('express');
const router = express.Router();
const gardenControl = require('../router_handler/gardencontrol');





router.post('/createGarden', gardenControl.createGarden);

router.get('/getgarden/:userId', gardenControl.getgarden);

router.get('/getGardenPage/:gardenid', gardenControl.getGardenPage);

router.post('/deletegarden', gardenControl.deletegarden);

module.exports = router;
