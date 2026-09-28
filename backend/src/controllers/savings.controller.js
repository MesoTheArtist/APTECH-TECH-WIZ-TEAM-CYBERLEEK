const SavingsGoal = require('../models/savingsGoal');

// POST /api/savings
const createGoal = async (req, res, next) => {
  try {
    const { goalName, title, targetAmount, targetDate, deadline } = req.body;
    
    const finalName = goalName || title;
    const finalDate = targetDate || deadline;

    if (!finalName || !targetAmount || !finalDate) {
      return res.status(400).json({ 
        status: 'error', 
        message: 'goalName, targetAmount and targetDate required' 
      });
    }

    const goal = await SavingsGoal.create({
      userId: req.user._id,      // your model uses userId
      user: req.user._id,        // add both to be safe
      goalName: finalName,
      title: finalName,
      targetAmount,
      currentAmount: 0,
      targetDate: finalDate,
      deadline: finalDate
    });

    res.status(201).json({ status: 'success', data: goal });
  } catch (err) {
    next(err);
  }
};

const getGoals = async (req, res, next) => {
  try {
    const goals = await SavingsGoal.find({ 
      $or: [{ userId: req.user._id }, { user: req.user._id }] 
    }).sort({ createdAt: -1 });
    res.json({ status: 'success', data: goals });
  } catch (err) { next(err); }
};

const addContribution = async (req, res, next) => {
  try {
    const { amount } = req.body;
    const goal = await SavingsGoal.findOne({ 
      _id: req.params.id,
      $or: [{ userId: req.user._id }, { user: req.user._id }] 
    });
    if (!goal) return res.status(404).json({ status: 'error', message: 'Goal not found' });

    goal.currentAmount = (goal.currentAmount || 0) + Number(amount);
    await goal.save();
    res.json({ status: 'success', data: goal });
  } catch (err) { next(err); }
};

const deleteGoal = async (req, res, next) => {
  try {
    await SavingsGoal.findOneAndDelete({ 
      _id: req.params.id,
      $or: [{ userId: req.user._id }, { user: req.user._id }] 
    });
    res.json({ status: 'success', data: null });
  } catch (err) { next(err); }
};

module.exports = { createGoal, getGoals, addContribution, deleteGoal };