const Album = require("../models/album");
const AlbumDTO = require("../dtos/albumDTO");

// Get all albums
exports.getAlbums = async (req, res) => {
	try {
		const albums = await Album.find().populate("artist");
		const albumsDTO = albums.map((album) => new AlbumDTO(album));
		res.status(200).json(albumsDTO);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};

// Get album by ID
exports.getAlbumById = async (req, res) => {
	try {
		const album = await Album.findById(req.params.id).populate("artist");
		if (!album) return res.status(404).json({ error: "Album not found" });
		res.status(200).json(new AlbumDTO(album));
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};
