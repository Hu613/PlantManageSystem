const express = require('express');
const router = express.Router();
const searchControl = require('../router_handler/searchcontrol');





router.post('/search', searchControl.search);


module.exports = router;
