defmodule Converter do

  def to_integer(value), do: extract(String.to_integer(value))

  defp extract({ value, _ }), do: value

end
