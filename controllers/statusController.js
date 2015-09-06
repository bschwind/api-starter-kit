"use strict";

var statusControler = {};

statusControler.ping = function (req, res) {
	res.send("HOW NEAT IS THAT");
};

module.exports = statusControler;
