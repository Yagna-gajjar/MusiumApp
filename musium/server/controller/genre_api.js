import songs from "../model/songs.js";
import mongoose from "mongoose";

export const Genre = async (req, res) => {
    try {
        let colorArray = ['#475c6c', '#cd8b62', '#741b47', '#cc0000', '#09cc00', '#ead1dc', '#999999', '#6a393b', '#37423d', '#b2ddf9']
        let generateRandomColor = () => {
            let color = Math.floor(Math.random() * (colorArray.length))
            let mycolor = colorArray[color]
            colorArray.splice(color, 1);
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

        const genreDataWithColors = genreData.map(doc => ({
            ...doc,
            themeColor: generateRandomColor()
        }));

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