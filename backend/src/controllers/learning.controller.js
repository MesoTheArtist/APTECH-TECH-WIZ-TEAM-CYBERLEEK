const LearningContent = require('../models/learningContent');

const getTips = async (req, res) => {
  const tips = await LearningContent.find().sort({ createdAt: -1 });
  res.json({ status: 'success', data: tips });
};

const createTip = async (req, res) => {
  const tip = await LearningContent.create(req.body);
  res.status(201).json({ status: 'success', data: tip });
};

module.exports = { getTips, createTip };