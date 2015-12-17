use iron::prelude::*;

use iron::middleware::{
	BeforeMiddleware
};

pub struct RequestLogger;

impl BeforeMiddleware for RequestLogger {
	fn before(&self, _: &mut Request) -> IronResult<()> {
		println!("Middleware!");
		Ok(())
	}
}
