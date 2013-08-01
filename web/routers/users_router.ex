defmodule UsersRouter do
  use Dynamo.Router

  import PageFormatHelpers

  import Dynamo.HTTP.Session

  prepare do
    conn = conn.fetch([:session, :params]) |>
                      title("Elixir Blog") |>
                      layout("main")
  end

  get "/:user_id" do
    { id, _ } = String.to_integer(user_id)
    render_user conn, UserQueries.find_by_id(id)
  end

  def render_user(conn, user) when user == nil, do: render(conn, "404.html", layout: "secondary")
  def render_user(conn, user), do: render(conn, "user/show.html", user: user)
end
