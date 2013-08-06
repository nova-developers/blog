defmodule PostsRouter do
  use Dynamo.Router

  @new "post/new.html"

  post "/create", do: redirect_post(conn, PostQueries.create(conn.params))

  get "/new", do: render(conn, @new)

  get "/", do: render(conn, "post/index.html", posts: PostQueries.all)

  get "/:post_id", do: render_post(conn, PostQueries.find_by_id(post_id))

  get "/*", do: render_post(conn, nil)

  defp redirect_post(conn, post) when post == nil, do: render(conn, @new, error: "Unable to save post")
  defp redirect_post(conn, post), do: redirect(conn, to: "/post/#{post.id}")

  defp render_post(conn, post) when post == nil, do: render(conn, "404.html", layout: "secondary")
  defp render_post(conn, post), do: render(conn, "post/show.html", post: post)
end
