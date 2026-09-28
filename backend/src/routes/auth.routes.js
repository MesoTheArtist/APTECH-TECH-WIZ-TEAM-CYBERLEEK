const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const User = require('../models/User');

const genToken = (id) => jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: '7d' });

router.post('/register', async (req, res) => {
  try {
    const { fullName, email, mobileNumber, phone, password } = req.body;
    const phoneNum = mobileNumber || phone || '';
    if (!fullName ||!email ||!password) {
      return res.status(400).json({ message: 'All fields required' });
    }
    let existing = await User.findOne({ email: email.toLowerCase() });
    if (existing) return res.status(400).json({ message: 'User already exists' });

    const user = await User.create({
      fullName,
      email: email.toLowerCase(),
      mobileNumber: phoneNum,
      phone: phoneNum,
      password,
    });

    const token = genToken(user._id);
    res.status(201).json({ success: true, token, user: { id: user._id, fullName: user.fullName, email: user.email, role: user.role } });
  } catch (err) {
    console.error('REGISTER ERROR:', err.message);
    res.status(500).json({ message: err.message });
  }
});

router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email.toLowerCase() });
    if (!user) return res.status(401).json({ message: 'Invalid credentials' });

    const isMatch = user.matchPassword? await user.matchPassword(password) : await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(401).json({ message: 'Invalid credentials' });

    const token = genToken(user._id);
    res.json({ success: true, token, user: { id: user._id, fullName: user.fullName, email: user.email, role: user.role } });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;