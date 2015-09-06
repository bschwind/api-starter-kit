"use strict";

var statusControler = {};

statusControler.ping = function (req, res) {
	res.send("THIS IS AWESOME");
};

module.exports = statusControler;
