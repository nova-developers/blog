Code.require_file("../blog.ex", __FILE__)

defmodule ApplicationRouter do
  use Dynamo.Router

  import PageFormatHelpers

  prepare do
    conn = conn.fetch([:cookies, :params]) |>
                      title("Elixir Blog") |>
                      layout("main")
  end

  forward "/posts", to: PostsRouter
  forward "/authentication", to: AuthenticationRouter
  forward "/user", to: UsersRouter

  get "/" do
    render conn, "index.html", posts: PostQueries.all
  end

  get "/*" do
    render conn, "404.html", layout: "secondary"
  end
end
