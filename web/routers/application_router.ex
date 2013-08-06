Code.require_file("../blog.ex", __FILE__)

defmodule ApplicationRouter do
  use Dynamo.Router

  import PageFormatHelpers

  prepare do
    conn = conn.fetch([:session, :params]) |>
                      title("Elixir Blog") |>
                      layout("main") |>
                      current_user
  end

  forward "/post", to: PostsRouter
  forward "/authentication", to: AuthenticationRouter
  forward "/user", to: UsersRouter

  get "/", do: render(conn, "post/index.html", posts: PostQueries.all)

  get "/*", do: render(conn, "404.html", layout: "secondary")
end
