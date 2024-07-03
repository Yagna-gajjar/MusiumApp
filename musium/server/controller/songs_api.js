import songs from "../model/songs.js";
import mongoose from "mongoose";

export const Songs = async (req, res) => {
    try {
        const songs_data = await songs.find();

        if (!songs_data) {
            return res.status(404).json({ msg: "song not found" });
        }
        res.status(200).json(songs_data);
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
}