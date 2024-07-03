import mongoose from "mongoose";

const songsSchema = new mongoose.Schema({
    title: {
        type: String,
        require: true
    },
    artist: {
        type: Array
    },
    album: {
        type: String
    },
    year: {
        type: Number
    },
    photo: {
        type: String
    },
    genre: {
        type: String
    },
    duration: {
        type: String,
        require: true
    },
    datetime: {
        type: Date,
        default: Date.now
    }
});

export default mongoose.model("songs", songsSchema);