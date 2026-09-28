require('dotenv').config();
const app = require('./app');
const connectDB = require('./config/db');
const logger = require('./utils/logger');

process.on('unhandledRejection', (err) => {
  logger.error(`Unhandled Rejection: ${err.message}`);
  process.exit(1);
});

connectDB();

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => logger.info(`🚀 PennyPal Server running on port ${PORT}`));