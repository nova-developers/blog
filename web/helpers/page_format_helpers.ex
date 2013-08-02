defmodule PageFormatHelpers do

  import Dynamo.HTTP.Session

  def title(conn, title), do: conn.assign(:title, title)

  def layout(conn, layout), do: conn.assign(:layout, layout)

  def current_user(conn), do: conn.assign(:current_user, get_session(conn, :current_user))
end
