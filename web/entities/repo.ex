alias Ecto.Adapters.Postgres

defmodule MyRepo do
  use Ecto.Repo, adapter: Postgres

  @env Mix.env

  def url, do: "ecto://postgres@localhost/blog_#{@env}"
end

{ :ok, _pid } = Postgres.start(MyRepo)
