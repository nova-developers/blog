defmodule PostsRouter do
  use Dynamo.Router

  get "/" do
    render conn, "index.html", posts: PostQueries.all
  end

  get "/:post_id" do
    render_post(conn, PostQueries.find_by_id(post_id))
  end

  def render_post(conn, post) when post == nil, do: render(conn, "404.html", layout: "secondary")
  def render_post(conn, post), do: render(conn, "post.html", post: post)
end
