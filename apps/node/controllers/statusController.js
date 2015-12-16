"use strict";

var statusControler = {};

statusControler.ping = function (req, res) {
	res.send("PONG");
};

module.exports = statusControler;
