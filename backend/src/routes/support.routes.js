const express = require('express');
const router = express.Router();
const { protect } = require('../middleware/auth.middleware');
const { authorize } = require('../middleware/roleCheck.middleware');
router.get('/all', protect, authorize('admin'), (req, res) => res.json({ message: 'Support OK' }));
module.exports = router;