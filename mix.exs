defmodule Blog.Mixfile do
  use Mix.Project

  def project do
    [ app: :blog,
      version: "0.0.1",
      dynamos: [Blog.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/blog/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Blog, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :ecto, github: "nurugger07/ecto" },
      { :pgsql, github: "semiocast/pgsql" }
    ]
  end
end
