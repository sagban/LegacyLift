class AlbumDTO {
	constructor(album) {
		this.id = album._id;
		this.title = album.title;
		this.artist = new ArtistDTO(album.artist);
		this.releaseDate = album.releaseDate;
		this.genre = album.genre;
		this.songs = album.songs.map((song) => new SongDTO(song)); // Assuming you have a SongDTO
		this.coverImage = album.coverImage;
	}
}

module.exports = AlbumDTO;
