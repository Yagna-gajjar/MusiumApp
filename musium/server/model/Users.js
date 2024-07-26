import mongoose from "mongoose";

const usersSchema = new mongoose.Schema({
    Username: {
        type: String,
        required: true
    },
    EmailAddress: {
        type: String,
        required: true
    },
    Password: {
        type: String,
        required: true
    },
    DateofBirth: {
        type: Date,
        required: true
    },
    Gender: {
        type: String,
        required: true
    },
    Country: {
        type: String,
        required: true
    },
    AppUseLanguage: {
        type: String,
        required: true
    },
    ProfilePicture: {
        type: String,
        required: true
    },
    AccountCreationDate: {
        type: Date,
        default: Date.now
    },
    FavoriteArtists: Array,
    FavoriteGenres: Array,
    FavoriteSongs: Array,
    FavoriteAlbums: Array,
    RecentlyPlayedSongs: Array,
    RecentlyPlayedArtists: Array,
    PlaylistCreationDate: Date,
    PlaylistFollowers: Number,
    FollowedArtists: Array,
    FollowedPlaylists: Array,
    FollowersCount: Number,
    FollowingCount: Number,
    ConnectedServices: Array

});

export default mongoose.model("users", usersSchema);