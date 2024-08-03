import app/web.{type Context}
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use _req <- web.middleware(req, ctx)

  case wisp.path_segments(req) {
    [] -> wisp.response(200)
    _ -> wisp.not_found()
  }
}