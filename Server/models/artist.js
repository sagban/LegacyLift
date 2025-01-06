const mongoose = require("mongoose");

const artistSchema = new mongoose.Schema({
	name: { type: String, required: true },
	genre: String,
	bio: String,
	profileImage: String, // Link to artist image
});

module.exports = mongoose.model("Artist", artistSchema);
