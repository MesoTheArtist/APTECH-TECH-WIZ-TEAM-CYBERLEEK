// Standard response helpers — every endpoint returns the same shape:
// { status: 'success', data: ... } or { status: 'error', message: ... }
const success = (res, data, statusCode = 200, extra = {}) =>
  res.status(statusCode).json({ status: 'success', data, ...extra });

const error = (res, message, statusCode = 500) =>
  res.status(statusCode).json({ status: 'error', message });

module.exports = { success, error };