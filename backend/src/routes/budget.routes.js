const express = require('express');
const router = express.Router();
const { protect } = require('../middleware/auth.middleware');
const { setBudget, getBudgets, deleteBudget } = require('../controllers/budget.controller');

router.use(protect); // all budget routes need login

router.route('/').post(setBudget).get(getBudgets);
router.route('/:id').delete(deleteBudget);

module.exports = router;