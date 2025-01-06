const Artist = require("../models/artist");
const ArtistDTO = require("../dtos/artistDTO");

// Get all artists
exports.getArtists = async (req, res) => {
	try {
		const artists = await Artist.find();
		const artistsDTO = artists.map((artist) => new ArtistDTO(artist));
		res.status(200).json(artistsDTO);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};

// Get artist by ID
exports.getArtistById = async (req, res) => {
	try {
		const artist = await Artist.findById(req.params.id);
		if (!artist) return res.status(404).json({ error: "Artist not found" });
		res.status(200).json(new ArtistDTO(artist));
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};
