"use strict";

var statusControler = {};

statusControler.ping = function (req, res) {
	res.send("pong");
};

module.exports = statusControler;
