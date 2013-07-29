Code.require_file "../../web/entities/repo.ex", __FILE__
Code.require_file "../../web/entities/posts.ex", __FILE__

Dynamo.under_test(Blog.Dynamo)
Dynamo.Loader.enable
ExUnit.start

alias Ecto.Adapters.Postgres

defmodule Blog.TestCase do
  use ExUnit.CaseTemplate

  setup do
    Dynamo.Loader.enable
  end

end
