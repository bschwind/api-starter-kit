extern crate iron;
extern crate router;

mod controllers;
mod middleware;

use iron::prelude::*;
use router::Router;

use controllers::{
	StatusController
};

use middleware::{
	RequestLogger
};

fn main() {
	let mut router = Router::new();

	// Set up routes here
	router.get("/api/v1/ping", StatusController::ping);

	let mut chain = Chain::new(router);

	// Add middleware here
	chain.link_before(RequestLogger);

	Iron::new(chain).http("localhost:8888").unwrap();
}
