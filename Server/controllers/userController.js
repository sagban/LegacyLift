const User = require("../models/user");
const UserDTO = require("../dtos/userDTO");

// Create a new user
exports.createUser = async (req, res) => {
	try {
		const user = new User(req.body);
		await user.save();
		res.status(201).json(new UserDTO(user));
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};

// Get a user by ID
exports.getUserById = async (req, res) => {
	try {
		const user = await User.findById(req.params.id).populate("playlists sleepHistory");
		if (!user) return res.status(404).json({ error: "User not found" });
		res.status(200).json(new UserDTO(user));
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};
