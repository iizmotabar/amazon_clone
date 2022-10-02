const express = require('express');
const User = require('../models/user_model');

const authRouter = express.Router();

// authRouter.get('/user', (req, res) => res.json({ msg: "Motabar " }));

//Signup route
authRouter.post('/api/signup', async (req, res) => {
    // Steps for post request
    // 1. Get the data from the client
    try {
        const { name: name, email: email, password: password } = req.body;
        const existingUser = await User.findOne({ email: email });
        if (existingUser) {
            return res.status(400)
                .json({ msg: "User with same email already exists" });
        }
        let user = new User({
            name,
            email,
            password,
        })
        user = await user.save;
        return res.json(user);

    }
    catch (error) {
        res.status(500).json({ error: error.message });

    }

    // 2. Post the data to the database

    // 3. Send the response back to the client
});




//* By default this authRouter is private, so to use it across the application we need to export it
module.exports = { authRouter };