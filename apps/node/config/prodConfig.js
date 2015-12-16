"use strict";

module.exports = {
	bcrypt: {
		cost: 12
	},

	postgres: {
		host: "127.0.0.1",
		db: process.env.DB_NAME,
		user: process.env.DB_USER,
		password: process.env.DB_PASSWORD
	}
};
