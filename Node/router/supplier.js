const express = require('express');
const router = express.Router();
const supplierControl = require('../router_handler/suppliercontrol');



router.get('/getsupplier', supplierControl.getsupplier);


router.get('/getplanttypesupplier', supplierControl.getplanttypesupplier);


router.get('/getpestsupplier', supplierControl.getpestsupplier);


router.get('/getplantkitsupplier', supplierControl.getplantkitsupplier);

module.exports = router;
