defmodule UsersRouter do
  use Dynamo.Router

  get "/:user_id" do
    render_user(conn, "user/show.html", UserQueries.find_by_id(user_id))
  end

  get "/:user_id/edit" do
    render_user(conn, "user/edit.html", UserQueries.find_by_id(user_id))
  end

  def render_user(conn, user, _page) when user == nil, do: render(conn, "404.html", layout: "secondary")
  def render_user(conn, user, page), do: render(conn, page, user: user)
end
