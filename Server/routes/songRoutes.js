const express = require("express");
const router = express.Router();
const songController = require("../controllers/songController");

// Get all songs
router.get("/songs", songController.getSongs);

// Get song by ID
router.get("/songs/:id", songController.getSongById);

module.exports = router;
