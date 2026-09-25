require('dotenv').config();
const app = require('./app');

// Standard practice: Add DB connection here once db.js is ready
// const connectDB = require('./config/db');
// connectDB();

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`🚀 PennyPal Server running on port ${PORT}`);
});
