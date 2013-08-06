defmodule PostsRouter do
  use Dynamo.Router

  post "/create" do
    post = PostQueries.create(conn.params)
    redirect(conn, to: "/post/#{post.id}")
  end

  get "/new", do: render(conn, "post/new.html")

  get "/", do: render(conn, "index.html", posts: PostQueries.all)

  get "/:post_id", do: render_post(conn, PostQueries.find_by_id(post_id))

  def render_post(conn, post) when post == nil, do: render(conn, "404.html", layout: "secondary")
  def render_post(conn, post), do: render(conn, "post/show.html", post: post)
end
