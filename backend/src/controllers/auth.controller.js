const User = require('../models/User');
const jwt = require('jsonwebtoken');

const generateToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET || 'secret', { expiresIn: '30d' });
};

// @route   POST /api/auth/register
const registerUser = async (req, res) => {
  try {
    const { fullName, email, mobileNumber, password } = req.body;

    if (!fullName || !email || !mobileNumber || !password) {
      return res.status(400).json({ status: 'error', message: 'Please provide all required fields' });
    }

    const userExists = await User.findOne({ email });
    if (userExists) {
      return res.status(400).json({ status: 'error', message: 'User already exists with this email' });
    }

    const user = await User.create({ fullName, email, mobileNumber, password });

    res.status(201).json({
      status: 'success',
      data: {
        _id: user._id,
        fullName: user.fullName,
        email: user.email,
        mobileNumber: user.mobileNumber,
        role: user.role,
        token: generateToken(user._id)
      }
    });
  } catch (error) {
    res.status(500).json({ status: 'error', message: error.message });
  }
};

// @route   POST /api/auth/login
const loginUser = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (user && (await user.matchPassword(password))) {
      res.json({
        status: 'success',
        data: {
          _id: user._id,
          fullName: user.fullName,
          email: user.email,
          role: user.role,
          token: generateToken(user._id)
        }
      });
    } else {
      res.status(401).json({ status: 'error', message: 'Invalid email or password' });
    }
  } catch (error) {
    res.status(500).json({ status: 'error', message: error.message });
  }
};

// @route   GET /api/auth/profile
const getUserProfile = async (req, res) => {
  if (req.user) {
    res.json({ status: 'success', data: req.user });
  } else {
    res.status(404).json({ status: 'error', message: 'User not found' });
  }
};

module.exports = { registerUser, loginUser, getUserProfile };
