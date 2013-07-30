Code.require_file "../blog.ex", __FILE__

defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
    conn.assign :layout, "main"
  end

  forward "/posts", to: PostsRouter

  get "/" do
    render conn, "index.html", posts: PostQueries.all, title: "Elixir Blog"
  end

  get "/*" do
    render conn, "404.html"
  end

end
