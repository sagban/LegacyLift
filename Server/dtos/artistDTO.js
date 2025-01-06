class ArtistDTO {
	constructor(artist) {
		this.id = artist._id;
		this.name = artist.name;
		this.genre = artist.genre;
		this.bio = artist.bio;
		this.profileImage = artist.profileImage;
	}
}

module.exports = ArtistDTO;
