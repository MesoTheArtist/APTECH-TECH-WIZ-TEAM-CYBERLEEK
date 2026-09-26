const mongoose = require('mongoose');

const budgetSchema = new mongoose.Schema(
  {
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    month: { type: String, required: true }, // Format: "YYYY-MM"
    category: { type: String, required: true },
    limitAmount: { type: Number, required: true, min: 0 },
    alertThreshold: { type: Number, default: 80 } // Percentage (e.g. 80%)
  },
  { timestamps: true }
);

module.exports = mongoose.model('Budget', budgetSchema);
