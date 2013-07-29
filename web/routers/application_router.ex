Code.require_file "../blog.ex", __FILE__

defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
    conn = conn.assign(:title, "Elixir Blog")
  end

  forward "/posts", to: PostsRouter

  get "/" do
    render conn, "index.html", posts: PostQueries.all
  end

  get "/*" do
    render conn, "404.html"
  end

end
