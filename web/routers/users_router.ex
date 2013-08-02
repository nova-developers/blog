defmodule UsersRouter do
  use Dynamo.Router

  get "/:user_id" do
    render_user(conn, UserQueries.find_by_id(user_id), "user/show.html")
  end

  get "/:user_id/edit" do
    render_user(conn, UserQueries.find_by_id(conn.params[:user_id]), "user/edit.html")
  end

  post "/:user_id" do
    UserQueries.update(conn.params)
    redirect conn, to: "/user/#{user_id}"
  end

  get "/*", do: render_user(conn, nil, '')

  def render_user(conn, user, _page) when user == nil, do: render(conn, "404.html", layout: "secondary")
  def render_user(conn, user, page), do: render(conn, page, user: user)
end
