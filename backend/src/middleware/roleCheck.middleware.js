// Only allows admin users
const roleCheck = (roles = ['admin']) => {
  return (req, res, next) => {
    if (!req.user) {
      return res.status(401).json({ status: 'error', message: 'Not authorized' });
    }
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ status: 'error', message: 'Forbidden: Admins only' });
    }
    next();
  };
};

module.exports = roleCheck;