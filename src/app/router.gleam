import app/web.{type Context}
import wisp.{type Request, type Response}

pub fn handle_request(_req: Request, _ctx: Context) -> Response {
  wisp.response(200)
}