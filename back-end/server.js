// initialize express and bodyparser module library
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = 3000;

// parse request of content-type: json
app.use(bodyParser.json());

// parse request of content-type: application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

//call route
var routes = require('./app/routes/routes');
routes(app);

// set port
app.listen(port, () => {
    console.log("Running on port " + port);
});