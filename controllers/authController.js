"use strict";

var validation = require("services/validation");

var authController = {};

authController.signup = function (req, res) {
	var data = {};

	validation.run(req, {
		username: [validation.required, validation.minMaxLength(3, 20), validation.isAscii],
		password: [validation.required, validation.minMaxLength(8, 1024)],
		passwordVerify: [validation.required],
		email: [validation.isEmail]
	})
	.then(function (fields) {
		console.log(fields);
		// fields.email and fields.training_results are guaranteed to be here
		// fields.some_int_field might be undefined since it's not required
		res.send("Hello " + fields.email);
	})
	.catch(validation.ValidationError, function(err) {
		data.message_code = 1;
		data.message = "Invalid data";
		data.errors = err.messages;
		// One of the fields is invalid. You could attach more information on the error object
		res.status(400).json(data);
	})
};

authController.login = function (req, res) {
	res.send("SIGNIN");
};

authController.logout = function (req, res) {
	res.send("SIGNOUT");
};

authController.update = function (req, res) {
	res.send("UPDATE");
};

module.exports = authController;
