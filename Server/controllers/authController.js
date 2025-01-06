const jwt = require("jsonwebtoken");
const User = require("../models/user");
const { validationResult } = require("express-validator");

// Register new user
exports.register = async (req, res) => {
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(400).json({ errors: errors.array() });
	}

	const { username, email, password } = req.body;

	try {
		// Check if user already exists
		let user = await User.findOne({ email });
		if (user) {
			return res.status(400).json({ msg: "User already exists" });
		}

		// Create new user
		user = new User({
			username,
			email,
			password,
		});

		await user.save();

		// Create JWT token
		const payload = { userId: user._id };
		const token = jwt.sign(payload, "your_jwt_secret", { expiresIn: "1h" });

		res.status(201).json({ token });
	} catch (err) {
		console.error(err.message);
		res.status(500).json({ msg: "Server error" });
	}
};

// Login user
exports.login = async (req, res) => {
	const { email, password } = req.body;

	try {
		let user = await User.findOne({ email });
		if (!user) {
			return res.status(400).json({ msg: "Invalid credentials" });
		}

		// Compare password
		const isMatch = await user.comparePassword(password);
		if (!isMatch) {
			return res.status(400).json({ msg: "Invalid credentials" });
		}

		// Create JWT token
		const payload = { userId: user._id };
		const token = jwt.sign(payload, "your_jwt_secret", { expiresIn: "1h" });

		res.status(200).json({ token });
	} catch (err) {
		console.error(err.message);
		res.status(500).json({ msg: "Server error" });
	}
};

// Get authenticated user
exports.getAuthenticatedUser = async (req, res) => {
	try {
		const user = await User.findById(req.userId).select("-password");
		if (!user) return res.status(404).json({ msg: "User not found" });
		res.status(200).json(user);
	} catch (err) {
		console.error(err.message);
		res.status(500).json({ msg: "Server error" });
	}
};
