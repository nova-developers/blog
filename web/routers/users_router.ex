defmodule UsersRouter do
  use Dynamo.Router

  get "/:user_id" do
    render_user(conn, UserQueries.find_by_id(user_id))
  end

  def render_user(conn, user) when user == nil, do: render(conn, "404.html", layout: "secondary")
  def render_user(conn, user), do: render(conn, "user/show.html", user: user)
end
