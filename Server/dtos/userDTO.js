class UserDTO {
	constructor(user) {
		this.id = user._id;
		this.username = user.username;
		this.email = user.email;
		this.profilePicture = user.profilePicture;
		this.playlists = user.playlists.map((playlist) => new PlaylistDTO(playlist));
		this.sleepHistory = user.sleepHistory; // You can create a SleepDTO if necessary
	}
}

module.exports = UserDTO;
