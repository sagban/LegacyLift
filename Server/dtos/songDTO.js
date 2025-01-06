class SongDTO {
	constructor(song) {
		this.id = song._id;
		this.title = song.title;
		this.artist = song.artist;
		this.album = song.album;
		this.genre = song.genre;
		this.duration = song.duration;
		this.fileURL = song.fileURL;
		this.isSleepTrack = song.isSleepTrack;
	}
}

module.exports = SongDTO;
