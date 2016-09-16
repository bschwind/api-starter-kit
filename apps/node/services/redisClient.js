"use strict";
var Redis = require("ioredis");

var redis = new Redis(process.env.REDIS_PORT, process.env.REDIS_HOST);

module.exports = redis;
