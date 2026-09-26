const express = require("express");
const router = express.Router();
const {
  getTransactions,
  createTransaction,
  updateTransaction,
  deleteTransaction,
} = require("../controllers/transaction.controller");
const { protect } = require("../middleware/auth.middleware");

router.use(protect); // Protect all transaction routes

router.route("/").get(getTransactions).post(createTransaction);

router.route("/:id").put(updateTransaction).delete(deleteTransaction);

module.exports = router;
