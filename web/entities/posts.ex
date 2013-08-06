defmodule Post do
  use Ecto.Entity

  dataset :posts do
    field :headline, :string
    field :content, :string
    field :user_id, :integer
  end
end

defmodule PostQueries do
  import Ecto.Query

  import Converter

  def create(vals) do
    Post.new(id: 0,
             headline: vals[:headline],
             content: vals[:content],
             user_id: to_integer(vals[:user_id])) |>
    _save(0)
  end

  def find_by_id(id) when is_integer(id), do: _find_by_id(id) |> _post
  def find_by_id(id) when is_binary(id), do: to_integer(id) |> _find_by_id |> _post

  def all, do: Enum.map(_all, fn(x) -> {x.id, x.headline, x.content} end)

  defp _save(post, id) when id > 0, do: MyRepo.update(post)
  defp _save(post, id) when id == 0, do: MyRepo.create(post)

  defp _post({ :ok, post }),  do: post
  defp _post(:error), do: nil

  defp _all, do: MyRepo.all(from p in Post)

  defp _find_by_id(id), do: MyRepo.all(from p in Post, where: p.id == id) |> Enum.fetch(0)
end
