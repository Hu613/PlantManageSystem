const express = require('express');
const router = express.Router();
const commentControl = require('../router_handler/commentcontrol');


router.post('/addcomment', commentControl.addcomment);

router.get('/getCommentsByPageId/:pageId', commentControl.getCommentsByPageId);

module.exports = router;
