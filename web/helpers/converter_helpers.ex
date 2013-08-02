defmodule Converter do

  def to_integer(value) do
    String.to_integer(value) |> extract_integer
  end

  defp extract_integer(:error), do: nil
  defp extract_integer({ value, _ }), do: value

end
