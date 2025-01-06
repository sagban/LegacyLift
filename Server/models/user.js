const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");

const userSchema = new mongoose.Schema({
	username: { type: String, required: true },
	email: { type: String, required: true, unique: true },
	password: { type: String, required: true },
	profilePicture: String,
	playlists: [{ type: mongoose.Schema.Types.ObjectId, ref: "Playlist" }],
	sleepHistory: [{ type: mongoose.Schema.Types.ObjectId, ref: "SleepSession" }],
});

// Hash password before saving
userSchema.pre("save", async function (next) {
	if (this.isModified("password")) {
		this.password = await bcrypt.hash(this.password, 10);
	}
	next();
});

// Method to compare password during login
userSchema.methods.comparePassword = async function (password) {
	return await bcrypt.compare(password, this.password);
};

module.exports = mongoose.model("User", userSchema);
