import songs from "../model/songs.js";
import mongoose from "mongoose";

export const Artist = async (req, res) => {
    try {
        const pipeline = [
            { $unwind: '$artist' },
            {
                $group: {
                    _id: '$artist',
                },
            },
            { $project: { _id: 0, artist: '$_id', image: { $concat: [{ $replaceAll: { input: '$_id', find: ' ', replacement: '_' } }, '.png'] } } },
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