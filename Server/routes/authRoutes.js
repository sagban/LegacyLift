const express = require("express");
const router = express.Router();
const { check } = require("express-validator");
const authController = require("../controllers/authController");
const authMiddleware = require("../middleware/authMiddleware");

// Register route
router.post(
	"/register",
	[
		check("username", "Username is required").not().isEmpty(),
		check("email", "Please include a valid email").isEmail(),
		check("password", "Password is required").not().isEmpty(),
	],
	authController.register
);

// Login route
router.post("/login", authController.login);

// Get authenticated user route
router.get("/me", authMiddleware, authController.getAuthenticatedUser);

module.exports = router;
