const express = require('express');
const router = express.Router();
const supplierControl = require('../router_handler/suppliercontrol');



router.get('/getsupplier', supplierControl.getsupplier);

module.exports = router;
