const express = require('express');

const authRouter = express.Router();

// authRouter.get('/user', (req, res) => res.json({ msg: "Motabar " }));

//Signup route
authRouter.post('/api/signup', (req, res) => {
    // Steps for post request
    // 1. Get the data from the request
    const { name, email, password } = req.body;
    // 2. Post the data to the database

    // 3. Send the response back to the client



});

//* By default this authRouter is private, so to use it across the application we need to export it
module.exports = {authRouter};