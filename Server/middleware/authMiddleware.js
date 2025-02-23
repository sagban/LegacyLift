const jwt = require("jsonwebtoken");

module.exports = function (req, res, next) {
	// Get token from header
	const token = req.header("x-auth-token");
	if (!token) {
		return res.status(401).json({ msg: "No token, authorization denied" });
	}

	try {
		const decoded = jwt.verify(token, "your_jwt_secret");
		req.userId = decoded.userId;
		next();
	} catch (err) {
		res.status(401).json({ msg: "Token is not valid" });
	}
};
