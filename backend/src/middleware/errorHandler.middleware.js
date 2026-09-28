// 404 handler — must be mounted AFTER all routes
const notFound = (req, res) => {
  res.status(404).json({ status: 'error', message: `Not Found - ${req.originalUrl}` });
};

// Global error handler — catches anything passed to next(err)
// eslint-disable-next-line no-unused-vars
const errorHandler = (err, req, res, next) => {
  console.error(err.stack);
  const statusCode = err.statusCode || 500;
  res.status(statusCode).json({
    status: 'error',
    message: err.message || 'Server Error',
  });
};

module.exports = { notFound, errorHandler };