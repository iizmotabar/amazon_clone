console.log('Hello Log');


//? BASIC NODE API
//* Importing the express module
const express = require('express');
const PORT = 3000;
const app = express();

app.get('/hello-world', (req, res) => res.json({ hi: 'Hello World' }));

app.get('/greetings', (req, res) => res.json({ name: "Hello Motabar" }))
app.listen(PORT, "0.0.0.0", () => console.log(`Sever Started at port: ${PORT}`));
