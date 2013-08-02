defmodule User do
  use Ecto.Entity

  dataset :users do
    field :email, :string
    field :password, :string
    field :full_name, :string
    field :gravatar, :string
    field :twitter, :string
    field :bio, :string
  end
end

defmodule AuthenticationQueries do
  import Ecto.Query

  def authenticate(email, password), do: match_email(email, password) |> UserQueries.user

  defp match_email(email, password), do: single_or_default(from u in User, where: u.email == email)

  defp single_or_default(query), do: all(query) |> Enum.fetch(0)

  defp all(query), do: MyRepo.all(query)

end

defmodule UserQueries do
  import Ecto.Query

  import Converter

  def update(vals) do
    User.new(id: vals[:user_id],
             full_name: vals[:full_name],
             password: vals[:password],
             email: vals[:email],
             bio: vals[:bio],
             gravatar: vals[:gravatar],
             twitter: vals[:twitter]) |>
    _save(vals[:user_id])
  end

  def find_by_id(id) when is_integer(id), do: _find_by_id(id) |> user
  def find_by_id(id) when is_binary(id), do: to_integer(id) |> _find_by_id |> user

  def user({ :ok, user }), do: user
  def user(:error), do: nil

  defp _save(user, id) when id > 0, do: MyRepo.update(user)
  defp _save(user, id) when id == 0, do: MyRepo.create(user)

  defp _find_by_id(id), do: MyRepo.all(from p in User, where: p.id == id) |> Enum.fetch(0)

end
