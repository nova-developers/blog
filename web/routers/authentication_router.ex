defmodule AuthenticationRouter do
  use Dynamo.Router

  @new "authentication/new.html"

  get "/new", do: render(conn, @new)

  post "/create" do
    redirect_authentication(conn, authenticate(conn))
  end

  get "/destroy", do: put_session(conn, :current_user, nil) |> redirect(to: "/")

  defp set_current_user(user, conn), do: put_session(conn, :current_user, user)

  defp redirect_authentication(conn, user) when user == nil do
    render(conn, @new, error: "Unable to authenticate. Please try again", email: email(conn))
  end

  defp redirect_authentication(conn, user) do
     set_current_user(user, conn) |>
     redirect(to: "/user/#{user.id}")
  end

  defp authenticate(conn), do: AuthenticationQueries.authenticate(email(conn), password(conn))
  defp email(conn), do: conn.params[:email]
  defp password(conn), do: conn.params[:password]
end
