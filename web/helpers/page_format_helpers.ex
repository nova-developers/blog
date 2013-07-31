defmodule PageFormatHelpers do

  def title(conn, title), do: conn.assign(:title, title)

  def layout(conn, layout), do: conn.assign(:layout, layout)

end

