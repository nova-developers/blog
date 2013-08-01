defmodule AuthenticationRouter do
  use Dynamo.Router

  import PageFormatHelpers

  import Dynamo.HTTP.Session

  prepare do
    conn = conn.fetch(:params) |>
                      title("Elixir Blog") |>
                      layout("main")

    conn = conn.fetch(:session)
  end

  get "/new" do
    render conn, "authentication/new.html"
  end

  post "/create" do
    user = AuthenticationQueries.authenticate(conn.params[:email], conn.params[:password])

    put_session(conn, :user, user) |>
    redirect to: "/user/#{user.id}"
  end

end
