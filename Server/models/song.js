const mongoose = require("mongoose");

const songSchema = new mongoose.Schema({
	title: { type: String, required: true },
	artist: { type: String, required: true },
	album: String,
	genre: String,
	duration: { type: Number, required: true }, // Duration in seconds
	fileURL: { type: String, required: true },
	isSleepTrack: { type: Boolean, default: false },
});

module.exports = mongoose.model("Song", songSchema);
