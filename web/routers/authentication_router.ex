defmodule AuthenticationRouter do
  use Dynamo.Router

  get "/new", do: render(conn, "authentication/new.html")

  post "/create" do
    user = AuthenticationQueries.authenticate(conn.params[:email], conn.params[:password])
    set_current_user(user, conn) |> redirect(to: "/user/#{user.id}")
  end

  get "/destroy", do: put_session(conn, :current_user, nil) |> redirect(to: "/")

  defp set_current_user(user, conn), do: put_session(conn, :current_user, user)
end
