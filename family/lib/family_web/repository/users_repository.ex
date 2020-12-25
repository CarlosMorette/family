defmodule FamilyWeb.UsersRepository do
  import Ecto.Query
  alias Family.Repo
  alias Family.Schemas.Users

  def create_user(data) do
    %Users{}
    |> Users.changeset(data)
    |> Repo.insert()
  end

  def list_all_users() do
    query = from _u in Users

    Repo.all(query)
    |> Enum.map(fn r ->
      r
      |> Map.delete(:__struct__)
      |> Map.delete(:__meta__)
    end)
  end
end
