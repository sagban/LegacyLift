const express = require("express");
const router = express.Router();
const albumController = require("../controllers/albumController");

// Get all albums
router.get("/albums", albumController.getAlbums);

// Get album by ID
router.get("/albums/:id", albumController.getAlbumById);

module.exports = router;
