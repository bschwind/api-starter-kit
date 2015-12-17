use iron::prelude::*;
use iron::status;

pub fn ping(_ : &mut Request) -> IronResult<Response> {
	Ok(Response::with((status::Ok, "pong")))
}
