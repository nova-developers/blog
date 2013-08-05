Code.require_file "../test_helper.exs", __FILE__

defmodule CucumberTests do
  use Blog.TestCase

  setup do
    Blog.Dynamo.run
    :ok
  end

  test :run_cucumber_features do
    Mix.shell.cmd("cucumber test/features --format progress")
  end
end
