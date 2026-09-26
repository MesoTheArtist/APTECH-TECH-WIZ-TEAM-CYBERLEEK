const Transaction = require('../models/Transaction');

// @desc    Get all transactions for logged in user (with optional filters)
// @route   GET /api/transactions
const getTransactions = async (req, res) => {
  try {
    const { type, category, startDate, endDate } = req.query;
    const filter = { userId: req.user._id };

    if (type) filter.type = type;
    if (category) filter.category = category;
    if (startDate || endDate) {
      filter.date = {};
      if (startDate) filter.date.$gte = new Date(startDate);
      if (endDate) filter.date.$lte = new Date(endDate);
    }

    const transactions = await Transaction.find(filter).sort({ date: -1 });
    res.json({ status: 'success', count: transactions.length, data: transactions });
  } catch (error) {
    res.status(500).json({ status: 'error', message: error.message });
  }
};

// @desc    Create new income/expense entry
// @route   POST /api/transactions
const createTransaction = async (req, res) => {
  try {
    const { type, amount, category, description, date, paymentMode } = req.body;

    if (!type || !amount || !category) {
      return res.status(400).json({ status: 'error', message: 'Type, amount, and category are required' });
    }

    const transaction = await Transaction.create({
      userId: req.user._id,
      type,
      amount,
      category,
      description,
      date: date || Date.now(),
      paymentMode: paymentMode || 'Cash'
    });

    res.status(201).json({ status: 'success', data: transaction });
  } catch (error) {
    res.status(500).json({ status: 'error', message: error.message });
  }
};

// @desc    Update transaction
// @route   PUT /api/transactions/:id
const updateTransaction = async (req, res) => {
  try {
    const transaction = await Transaction.findById(req.params.id);

    if (!transaction) {
      return res.status(404).json({ status: 'error', message: 'Transaction not found' });
    }

    if (transaction.userId.toString() !== req.user._id.toString()) {
      return res.status(401).json({ status: 'error', message: 'Not authorized to update this entry' });
    }

    const updatedTransaction = await Transaction.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true, runValidators: true }
    );

    res.json({ status: 'success', data: updatedTransaction });
  } catch (error) {
    res.status(500).json({ status: 'error', message: error.message });
  }
};

// @desc    Delete transaction
// @route   DELETE /api/transactions/:id
const deleteTransaction = async (req, res) => {
  try {
    const transaction = await Transaction.findById(req.params.id);

    if (!transaction) {
      return res.status(404).json({ status: 'error', message: 'Transaction not found' });
    }

    if (transaction.userId.toString() !== req.user._id.toString()) {
      return res.status(401).json({ status: 'error', message: 'Not authorized to delete this entry' });
    }

    await transaction.deleteOne();
    res.json({ status: 'success', message: 'Transaction removed' });
  } catch (error) {
    res.status(500).json({ status: 'error', message: error.message });
  }
};

module.exports = {
  getTransactions,
  createTransaction,
  updateTransaction,
  deleteTransaction
};
