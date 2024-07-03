import express from "express";
import { Songs } from "../controller/songs_api.js";
import { Genre } from "../controller/genre_api.js";
import { Songs_Artist } from "../controller/songs_artist_api.js";
import { Artist } from "../controller/AllArtists.js";

const route = express.Router();

route.get("/AllSongs", Songs);
route.get("/Genre", Genre);
route.get("/Artist_Songs", Songs_Artist);
route.get("/Artist", Artist);

export default route;