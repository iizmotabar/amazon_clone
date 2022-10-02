console.log('Starting Server...')

//* Importing the packages
const express = require('express');
const mongoose = require('mongoose');

const DB = "mongodb+srv://iizmotabar:@cluster0.m2simkb.mongodb.net/?retryWrites=true&w=majority";

//* Importing from files
const authRouter = require('./routes/auth');

//* Initializing the app
const PORT = 3000;
const app = express();

//* Middleware - A function that is responsible for how the data is formatted from client to server - should be after the app initialization
//! Important to note that the middleware has to be placed so to get external data from other files
app.use(express.json());
app.use(authRouter.authRouter);


//Connecting to the database
mongoose.connect(DB).then(() => {
    console.log(`Connection Successful`);
}).catch((err) => {
    console.log('Failed to establish a connnection');
});

app.get('/hello-world', (req, res) => res.json({ hi: 'Hello World' }));

app.get('/greetings', (req, res) => res.json({ name: "Hello Motabar" }))
app.listen(PORT, "0.0.0.0", () => console.log(`Server Started at port: ${PORT}`));
