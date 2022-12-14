const express = require('express');
const User = require('../models/user_model');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middlewares/auth');



const authRouter = express.Router();

//Signup route
authRouter.post('/api/signup', async (req, res) => {
    // Steps for post request
    // 1. Get the data from the client
    try {
        const { name: name, email: email, password: password } = req.body;
        const existingUser = await User.findOne({ email: email });
        if (existingUser) {
            return res.status(400)
                .json({ msg: "User with same email already exist" });


        }
        const hashedPwd = await bcrypt.hash(password, 8);
        // 2. Post the data to the database
        let user = new User({
            name: name,
            email: email,
            password: hashedPwd,
        })
        user = await user.save();
        return res.json(user);

    }
    catch (error) {
        res.status(500).json({ error: error.message });

    }
    // 3. Send the response back to the client
});

//signin route
authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email: email, password: password } = req.body;
        const user = await User.findOne({ email: email });
        if (!user) {
            return res.status(400).json({ msg: "User does not exist" });
        }
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Invalid credentials" });
        }
        const token = jwt.sign({ id: user._id }, "passwordKey"); //* "passwordKey" is the public key with which the token is signed
        res.json({ token, ...user._doc });
    }
    catch (error) {
        res.status(500).json({ error: error.message });
    }
});

authRouter.post('/tokenIsValid', async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        if (!token) {
            return res.json(false);
        }
        const verifiedToken = jwt.verify(token, "passwordKey");
        if (!verifiedToken) {
            return res.json(false);
        }
        const user = await User.findById(verifiedToken.id);
        res.json(true);
    }
    catch (error) {
        res.status(500).json({ error: error.message });
    }
});



//* By default this authRouter is private, so to use it across the application we need to export it
authRouter.get('/', auth, async (req,res)=> {
    const user = await User.findById(req.user);
    res.json({...user._doc,token: req.token});

});
module.exports = { authRouter };