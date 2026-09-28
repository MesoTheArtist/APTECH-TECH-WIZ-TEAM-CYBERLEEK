const express = require('express');
const router = express.Router();
const { protect, authorize } = require('../middleware/auth.middleware');
const { createTicket, getMyTickets, getAllTickets, replyTicket } = require('../controllers/support.controller');

router.use(protect);
router.post('/', createTicket);
router.get('/my', getMyTickets);

// Admin only
router.get('/all', authorize('admin'), getAllTickets);
router.patch('/:id/reply', authorize('admin'), replyTicket);

module.exports = router;