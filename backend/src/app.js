const express = require('express');
const cors = require('cors');

// Import routes
const authRoutes = require('./routes/auth.routes');
const transactionRoutes = require('./routes/transaction.routes');
const budgetRoutes = require('./routes/budget.routes');
const savingsRoutes = require('./routes/savings.routes');
// ... import other routes

// Import middleware
const { notFound, errorHandler } = require('./middleware/errorHandler.middleware');

const app = express();

// Global Middleware
app.use(cors());
app.use(express.json());

// Base Route
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', message: 'PennyPal API Service Online' });
});

// API Routes
app.use('/api/auth', authRoutes);
app.use('/api/transactions', transactionRoutes);
app.use('/api/budgets', budgetRoutes);
app.use('/api/savings', savingsRoutes);

// Error Handling (must be LAST, after all routes)
app.use(notFound);
app.use(errorHandler);

module.exports = app;