const mongoose = require('mongoose');

const transactionSchema = new mongoose.Schema(
  {
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    type: { type: String, enum: ['income', 'expense'], required: true },
    amount: { type: Number, required: true, min: 0 },
    category: {
      type: String,
      enum: ['Food', 'Transport', 'Education', 'Shopping', 'Entertainment', 'Bills', 'Savings', 'Miscellaneous', 'Income Source'],
      required: true
    },
    description: { type: String, trim: true },
    date: { type: Date, default: Date.now },
    paymentMode: { type: String, enum: ['Cash', 'Card', 'Transfer', 'Other'], default: 'Cash' },
    receiptImageUrl: { type: String, default: null }
  },
  { timestamps: true }
);

module.exports = mongoose.model('Transaction', transactionSchema);
