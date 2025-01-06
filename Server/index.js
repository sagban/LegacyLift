const express = require("express");
const mongoose = require("mongoose");
const authRoutes = require("./routes/authRoutes");
const userRoutes = require("./routes/userRoutes");
const songRoutes = require("./routes/songRoutes");
const albumRoutes = require("./routes/albumRoutes");
const artistRoutes = require("./routes/artistRoutes");

const app = express();

app.use(express.json());

mongoose
	.connect("mongodb://localhost/music-app", {
		useNewUrlParser: true,
		useUnifiedTopology: true,
	})
	.then(() => {
		console.log("Connected to MongoDB");
	})
	.catch((err) => {
		console.log("Error connecting to MongoDB:", err);
	});

// Use authentication routes
app.use("/api/auth", authRoutes);

// Use other routes
app.use("/api", userRoutes);
app.use("/api", songRoutes);
app.use("/api", albumRoutes);
app.use("/api", artistRoutes);

const PORT = 5000;
app.listen(PORT, () => {
	console.log(`Server is running on port ${PORT}`);
});
