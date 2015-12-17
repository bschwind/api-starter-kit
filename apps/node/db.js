"use strict";

var config = require("config/config");

// TODO - Move DB credentials into environment variables
var db = require("knex")({
	client: "pg",
	connection: {
		host : config.postgres.host,
		user : config.postgres.user,
		password : config.postgres.password,
		database : config.postgres.db
	}
});

module.exports = db;
