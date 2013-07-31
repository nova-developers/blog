Code.require_file("../../web/routers/blog.ex", __FILE__)

Dynamo.under_test(Blog.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Blog.TestCase do
  use ExUnit.CaseTemplate

  setup do
    Dynamo.Loader.enable
  end

end
