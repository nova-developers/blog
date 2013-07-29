Code.require_file "../../test_helper.exs", __FILE__

alias Ecto.Adapters.Postgres

# Feature tests goes through the Dynamo.under_test
# and are meant to test the full stack.
defmodule PostsRouterTest do
  use Blog.TestCase
  use Dynamo.HTTP.Case

  @endpoint PostsRouter
  @post Post[headline: 'Revenge of the Sith', content: 'Really cool new content goes here']

  setup do
    Postgres.query(MyRepo, "INSERT INTO posts (headline, content) VALUES ('#{@post.headline}', '#{@post.content}');")
    :ok
  end

  teardown do
    Postgres.query(MyRepo, "DELETE FROM posts;")
    :ok
  end

  test :posts do
    conn = get("/")

    assert conn.resp_body =~ "#{@post.headline}"
    assert conn.resp_body =~ "#{@post.content}"
    assert conn.status == 200
  end
end
