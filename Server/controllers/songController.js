const Song = require("../models/song");
const SongDTO = require("../dtos/songDTO");

// Get all songs
exports.getSongs = async (req, res) => {
	try {
		const songs = await Song.find();
		const songsDTO = songs.map((song) => new SongDTO(song));
		res.status(200).json(songsDTO);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};

// Get song by ID
exports.getSongById = async (req, res) => {
	try {
		const song = await Song.findById(req.params.id);
		if (!song) return res.status(404).json({ error: "Song not found" });
		res.status(200).json(new SongDTO(song));
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};
