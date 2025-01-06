const mongoose = require("mongoose");
const songSchema = require("./song");

const playlistSchema = new mongoose.Schema({
	name: { type: String, required: true },
	description: String,
	songs: [songSchema],
	coverImage: String,
	createdDate: { type: Date, default: Date.now },
});

module.exports = mongoose.model("Playlist", playlistSchema);
