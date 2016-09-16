"use strict";

var Promise = require("bluebird");
var config = require("config/config");
var validation = require("services/validation");
var bcrypt = require("bcrypt");
var hashPromise = Promise.promisify(bcrypt.hash);
var db = require("db");

var authController = {};

function UserAlreadyExistsError() {}
UserAlreadyExistsError.prototype = Object.create(Error.prototype);

function PasswordsNotEqualError() {}
PasswordsNotEqualError.prototype = Object.create(Error.prototype);

authController.signup = function (req, res) {
	var data = {};

	validation.run(req, {
		username: [validation.required, validation.minMaxLength(3, 20), validation.isAscii],
		password: [validation.required, validation.minMaxLength(8, 4096)],
		passwordVerify: [validation.required, validation.minMaxLength(8, 4096)],
		email: [validation.isEmail]
	})
	.then(function (fields) {
		if (fields.password !== fields.passwordVerify) {
			throw new PasswordsNotEqualError();
		}

		return [
			db("users")
			.select("id")
			.where({
				username: fields.username
			})
			.limit(1),
			fields
		];
	})
	.spread(function (existingUser, fields) {
		if (existingUser.length > 0) {
			throw new UserAlreadyExistsError();
		}

		var bcryptCost = 12;

		return [hashPromise(fields.password, bcryptCost), fields];
	})
	.spread(function (hashedPassword, fields) {
		return db
		.insert({
			username: fields.username,
			password: hashedPassword,
			email: fields.email
		})
		.into("users");
	})
	.then(function () {
		data.message_code = 4;
		data.message = "Successful registration";
		res.status(200).json(data);
	})
	.catch(validation.ValidationError, function (err) {
		data.message_code = 1;
		data.message = "Invalid data";
		data.errors = err.messages;
		res.status(400).json(data);
	})
	.catch(PasswordsNotEqualError, function (err) {
		data.message_code = 2;
		data.message = "Passwords do not match";
		res.status(400).json(data);
	})
	.catch(UserAlreadyExistsError, function (err) {
		data.message_code = 3;
		data.message = "Username already taken";
		res.status(400).json(data);
	})
	.catch(function (err) {
		console.log(err);
		data.message_code = 500;
		data.message = "Internal server error";
		res.status(500).json(data);
	});
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
