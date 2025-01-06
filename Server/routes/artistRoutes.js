const express = require("express");
const router = express.Router();
const artistController = require("../controllers/artistController");

// Get all artists
router.get("/artists", artistController.getArtists);

// Get artist by ID
router.get("/artists/:id", artistController.getArtistById);

module.exports = router;
