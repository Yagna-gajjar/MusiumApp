import songs from "../model/songs.js";
import mongoose from "mongoose";

export const Genre = async (req, res) => {
    try {
        let colors = {
            'Kpop': '#cc00cc',
            'Filmi': '#ffd9b3',
            'Romantic': '#ff80aa',
            'Chill': '#2eb82e',
            'Pop': '#ff6600',
        }
        let generateRandomColor = (genre) => {
            let mycolor = colors[genre]
            return mycolor;
        };

        const pipeline = [
            {
                $group: {
                    _id: '$genre',
                    songs: {
                        $push: {
                            title: '$title',
                            artist: '$artist',
                            duration: '$duration',
                        },
                    },
                },
            },
            {
                $project: {
                    _id: 0,
                    genre: '$_id',
                    image: {
                        $concat: [{ $replaceAll: { input: '$_id', find: ' ', replacement: '_' } }, '.png']
                    }
                }
            }
        ];

        const genreData = await songs.aggregate(pipeline);
        const genreDataWithColors = genreData.map(doc => (
            {
                ...doc,
                themeColor: generateRandomColor(doc.genre)
            }
        )
        );

        console.log(genreDataWithColors);

        if (!genreDataWithColors) {
            return res.status(404).json({ msg: "genre not found" });
        }
        res.status(200).json(genreDataWithColors);
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
}