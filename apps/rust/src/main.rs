extern crate iron;
extern crate router;

mod controllers;

use iron::prelude::*;
use router::{Router};

use controllers::status_controller;

fn main() {
	let mut router = Router::new();

	router.get("/api/v1/ping", status_controller::ping);

	Iron::new(router).http("localhost:8888").unwrap();
}
