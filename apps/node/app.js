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
var authController = require("controllers/authController");

// Services

// Create app
var app = express();

// Set up middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Set up routes
app.get("/api/v1/ping", statusController.ping);
app.post("/api/v1/auth/signup", authController.signup);
app.post("/api/v1/auth/login", authController.login);
app.post("/api/v1/auth/logout", authController.logout);
app.post("/api/v1/auth/update", authController.update);

// Start the server
var server = app.listen(8888, function () {
    console.log("node-api server started");
    console.log("Listening on port %d", server.address().port);
});
