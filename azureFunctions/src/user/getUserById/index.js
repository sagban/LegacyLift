const User = require("../../models/user");
const UserDTO = require("../../dtos/userDTO");

module.exports = async function (context, req) {
	try {
		const user = await User.findById(req.params.id).populate("playlists sleepHistory");
		if (!user) {
			context.res = {
				status: 404,
				body: { error: "User not found" },
			};
			return;
		}
		context.res = {
			status: 200,
			body: new UserDTO(user),
		};
	} catch (err) {
		context.log.error(err.message);
		context.res = {
			status: 500,
			body: { error: err.message },
		};
	}
};
