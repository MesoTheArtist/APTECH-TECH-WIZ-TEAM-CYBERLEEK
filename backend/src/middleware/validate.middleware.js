// Simple validation helper
const validate = (schema) => {
  return (req, res, next) => {
    try {
      // schema is a function that returns true or throws
      const result = schema(req.body);
      if (result !== true) {
        return res.status(400).json({ status: 'error', message: result });
      }
      next();
    } catch (err) {
      next(err);
    }
  };
};

module.exports = validate;