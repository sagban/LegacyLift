const mongoose = require("mongoose");
const songSchema = require("./song");

const albumSchema = new mongoose.Schema({
	title: { type: String, required: true },
	artist: { type: mongoose.Schema.Types.ObjectId, ref: "Artist" },
	releaseDate: Date,
	genre: String,
	songs: [songSchema],
	coverImage: String, // Link to album cover image
});

module.exports = mongoose.model("Album", albumSchema);
