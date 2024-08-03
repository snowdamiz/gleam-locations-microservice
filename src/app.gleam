import app/router
import app/web.{Context}
import dot_env
import dot_env/env
import gleam/erlang/process
import mist
import wisp

pub fn main() {
  wisp.configure_logger()

  dot_env.new()
  |> dot_env.set_path(".env")
  |> dot_env.set_debug(False)
  |> dot_env.load

  let assert Ok(secret_key) = env.get_string("SECRET_KEY") 

  let ctx = Context(items: [])

  let handler = router.handle_request(_, ctx)

  let assert Ok(_) =
    wisp.mist_handler(handler, secret_key)
    |> mist.new
    |> mist.port(9000)
    |> mist.start_http

  process.sleep_forever()
}