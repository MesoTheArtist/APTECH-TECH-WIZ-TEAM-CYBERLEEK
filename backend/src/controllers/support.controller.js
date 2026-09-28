const SupportTicket = require('../models/supportTicket');

const createTicket = async (req, res, next) => {
  try {
    const ticket = await SupportTicket.create({
      userId: req.user._id,
      subject: req.body.subject,
      message: req.body.message
    });
    res.status(201).json({ status: 'success', data: ticket });
  } catch (err) { next(err); }
};

const getMyTickets = async (req, res, next) => {
  try {
    const tickets = await SupportTicket.find({ userId: req.user._id }).sort({ createdAt: -1 });
    res.json({ status: 'success', data: tickets });
  } catch (err) { next(err); }
};

const getAllTickets = async (req, res, next) => {
  try {
    const tickets = await SupportTicket.find().populate('userId', 'fullName email').sort({ createdAt: -1 });
    res.json({ status: 'success', data: tickets });
  } catch (err) { next(err); }
};

const replyTicket = async (req, res, next) => {
  try {
    const ticket = await SupportTicket.findByIdAndUpdate(
      req.params.id,
      { response: req.body.response, status: req.body.status || 'in_progress' },
      { new: true }
    );
    res.json({ status: 'success', data: ticket });
  } catch (err) { next(err); }
};

module.exports = { createTicket, getMyTickets, getAllTickets, replyTicket };