defmodule AppIncludes do

  def include_all(directories) do
    Enum.each(directories, fn(x) -> AppIncludes.include_directory(Path.expand("../../#{x}", __FILE__)) end)
  end

  def include_directory(dir) do
    list_files(dir) |> require_for(dir)
  end

  defp list_files(dir), do: File.ls(dir)

  defp require_for({ :error, _ }, _dir), do: nil
  defp require_for({ :ok, files }, dir) do
    Enum.each(files, fn(file) -> Code.require_file("#{dir}/#{file}") end)
  end

end

AppIncludes.include_all([:helpers, :entities])
