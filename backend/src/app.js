const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors({ origin: true, credentials: true }));
app.use(express.json());

app.use('/api/auth', require('./routes/auth.routes'));
app.use('/api/budget', require('./routes/budget.routes'));
app.use('/api/budgets', require('./routes/budget.routes'));
app.use('/api/savings', require('./routes/savings.routes'));
app.use('/api/transactions', require('./routes/transaction.routes'));
app.use('/api/transaction', require('./routes/transaction.routes'));
app.use('/api/admin', require('./routes/admin.routes'));
app.use('/api/support', require('./routes/support.routes'));
app.use('/api/learning', require('./routes/learning.routes'));

app.get('/', (req, res) => res.json({ message: 'PennyPal API running', db: 'pennypal connected' }));

module.exports = app;