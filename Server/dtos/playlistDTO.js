class PlaylistDTO {
	constructor(playlist) {
		this.id = playlist._id;
		this.name = playlist.name;
		this.description = playlist.description;
		this.songs = playlist.songs.map((song) => new SongDTO(song));
		this.coverImage = playlist.coverImage;
		this.createdDate = playlist.createdDate;
	}
}

module.exports = PlaylistDTO;
