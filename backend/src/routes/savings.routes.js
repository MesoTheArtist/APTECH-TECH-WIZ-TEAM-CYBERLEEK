const express = require('express');
const router = express.Router();
const { protect } = require('../middleware/auth.middleware');
const { createGoal, getGoals, addContribution, deleteGoal } = require('../controllers/savings.controller');

router.use(protect);

router.route('/').post(createGoal).get(getGoals);
router.patch('/:id/add', addContribution);
router.delete('/:id', deleteGoal);

module.exports = router;