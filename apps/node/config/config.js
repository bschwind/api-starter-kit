"use strict";

if (process.env.environment_version === "PROD") {
	module.exports = require("config/prodConfig");
} else {
	module.exports = require("config/devConfig");
}
