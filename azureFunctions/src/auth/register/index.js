const { check, validationResult } = require("express-validator");
const jwt = require("jsonwebtoken");
const User = require("../../models/user");

module.exports = async function (context, req) {
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		context.res = {
			status: 400,
			body: { errors: errors.array() },
		};
		return;
	}

	const { username, email, password } = req.body;

	try {
		let user = await User.findOne({ email });
		if (user) {
			context.res = {
				status: 400,
				body: { msg: "User already exists" },
			};
			return;
		}

		user = new User({ username, email, password });
		await user.save();

		const payload = { userId: user._id };
		const token = jwt.sign(payload, "your_jwt_secret", { expiresIn: "1h" });

		context.res = {
			status: 201,
			body: { token },
		};
	} catch (err) {
		context.log.error(err.message);
		context.res = {
			status: 500,
			body: { msg: "Server error" },
		};
	}
};
