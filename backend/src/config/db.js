const mongoose = require('mongoose');
const dns = require('node:dns');
try { dns.setServers(['8.8.8.8', '1.1.1.1', '8.8.4.4']); } catch(e){}

const connectDB = async () => {
  try {
    mongoose.set('strictQuery', true);
    const conn = await mongoose.connect(process.env.MONGO_URI, {
      serverSelectionTimeoutMS: 15000,
      family: 4,
    });
    console.log(`✅ MongoDB Connected: ${conn.connection.host} - DB: ${conn.connection.name}`);
    return conn;
  } catch (err) {
    console.error('❌ MongoDB Failed:', err.message);
    console.log('💡 Fix: Switch to phone hotspot or set DNS to 8.8.8.8');
    process.exit(1);
  }
};

module.exports = connectDB;