"use strict";

// TODO - Move DB credentials into environment variables
var db = require("knex")({
	client: "pg",
	connection: {
		host : process.env.DB_HOST,
		user : process.env.DB_USERNAME,
		password : process.env.DB_PASSWORD,
		database : process.env.DB_NAME
	}
});

module.exports = db;
