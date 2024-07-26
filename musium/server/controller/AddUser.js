import users from '../model/Users.js';
import mongoose from "mongoose";

export const add_Users = async (req, res) => {
    console.log("point 1");
    try {
        console.log("point 2");
        const userData = new users({
            _id: new mongoose.Types.ObjectId(),
            Username: req.body.Username,
            EmailAddress: req.body.EmailAddress,
            Password: req.body.Password,
            DateofBirth: req.body.DateofBirth,
            Gender: req.body.Gender,
            Country: req.body.Country,
            AppUseLanguage: req.body.AppUseLanguage,
            ProfilePicture: req.body.ProfilePicture,
        });
        console.log("point 3");
        if (!userData) {
            return res.status(404).json({ msg: "user data not found" });
        }
        await userData.save();
        res.status(200).json({ msg: "subscribe added successfully" });
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
};