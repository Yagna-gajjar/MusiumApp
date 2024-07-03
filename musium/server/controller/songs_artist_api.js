import songs from "../model/songs.js";
import mongoose from "mongoose";

export const Songs_Artist = async (req, res) => {
    try {
        const pipeline = [
            { $unwind: '$artist' },
            {
                $group: {
                    _id: '$artist',
                    songs: { $push: '$$ROOT' },
                },
            },
            { $project: { _id: 0, artist: '$_id', songs: 1 } },
        ];
        const artist_data = await songs.aggregate(pipeline);

        if (!artist_data) {
            return res.status(404).json({ msg: "genre not found" });
        }
        res.status(200).json(artist_data);
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
}