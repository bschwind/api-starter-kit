"use strict";

// Setup base path for modules loading
require("app-module-path").addPath(__dirname);

// Modules
var config = require("config/config");
var express = require("express");

// Middlewares
var bodyParser = require("body-parser");

// Controllers
var statusController = require("controllers/statusController");

// Services

// Create app
var app = express();

// Set up middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Set up routes
app.get("/api/v1/ping", statusController.ping);

// Start the server
var server = app.listen(3000, function () {
    console.log("Attache-node-api server started");
    console.log("Listening on port %d", server.address().port);
});
