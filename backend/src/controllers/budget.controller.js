const Budget = require('../models/budget');
const Transaction = require('../models/transaction');

// @desc Set or update monthly budget
// @route POST /api/budgets
const setBudget = async (req, res, next) => {
  try {
    const { amount, month, year, category } = req.body;

    if (!amount ||!month ||!year) {
      return res.status(400).json({ status: 'error', message: 'amount, month, year are required' });
    }

    const budget = await Budget.findOneAndUpdate(
      { user: req.user._id, month, year, category: category || 'Overall' },
      { amount, user: req.user._id, month, year, category: category || 'Overall' },
      { new: true, upsert: true }
    );

    res.status(201).json({ status: 'success', data: budget });
  } catch (err) {
    next(err);
  }
};

// @desc Get my budgets + spent so far
// @route GET /api/budgets
const getBudgets = async (req, res, next) => {
  try {
    const { month, year } = req.query;
    const filter = { user: req.user._id };
    if (month) filter.month = month;
    if (year) filter.year = year;

    const budgets = await Budget.find(filter);

    // Calculate spent for each budget
    const budgetsWithSpent = await Promise.all(
      budgets.map(async (b) => {
        const spentAgg = await Transaction.aggregate([
          {
            $match: {
              user: req.user._id,
              type: 'expense',
              $expr: {
                $and: [
                  { $eq: [{ $month: '$date' }, b.month] },
                  { $eq: [{ $year: '$date' }, b.year] }
                ]
              }
            }
          },
          { $group: { _id: null, total: { $sum: '$amount' } } }
        ]);
        const spent = spentAgg[0]?.total || 0;
        return {
         ...b.toObject(),
          spent,
          remaining: b.amount - spent,
          percentUsed: Math.round((spent / b.amount) * 100)
        };
      })
    );

    res.json({ status: 'success', data: budgetsWithSpent });
  } catch (err) {
    next(err);
  }
};

// @desc Delete budget
// @route DELETE /api/budgets/:id
const deleteBudget = async (req, res, next) => {
  try {
    const budget = await Budget.findOneAndDelete({ _id: req.params.id, user: req.user._id });
    if (!budget) return res.status(404).json({ status: 'error', message: 'Budget not found' });
    res.json({ status: 'success', data: null });
  } catch (err) {
    next(err);
  }
};

module.exports = { setBudget, getBudgets, deleteBudget };