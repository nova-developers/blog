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

  defp match_email(email, password) do
    MyRepo.all(from u in User, where: u.email == email) |> Enum.fetch(0)
  end

end


defmodule UserQueries do
  import Ecto.Query

  import Converter

  def find_by_id(id) when is_integer(id), do: _find_by_id(id) |> user
  def find_by_id(id) when is_binary(id), do: to_integer(id) |> _find_by_id |> user

  def user({ :ok, user }), do: user
  def user(:error), do: nil


  defp _find_by_id(id), do: MyRepo.all(from p in User, where: p.id == id) |> Enum.fetch(0)

end
