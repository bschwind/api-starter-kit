"use strict";

module.exports = {
	bcrypt: {
		cost: 12
	},

	postgres: {
		host: process.env.DB_HOST,
		db: process.env.DB_NAME,
		user: process.env.DB_USERNAME,
		password: process.env.DB_PASSWORD
	}
};
