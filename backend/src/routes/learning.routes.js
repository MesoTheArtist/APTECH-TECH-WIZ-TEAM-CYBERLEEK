const express = require('express');
const router = express.Router();
const { getTips, createTip } = require('../controllers/learning.controller');

router.get('/', getTips);
router.post('/', createTip);

module.exports = router;