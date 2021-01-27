defmodule FamilyWeb.UserRepository do
  import Ecto.Query
  alias Family.Repo
  alias Family.Schemas.User

  def list_all_users() do
    query = from(u in User, select: %{name: u.name, email: u.email, age: u.age, id: u.id})
    Repo.all(query)
  end

  def create_user(data) do
    result = %User{} |> User.changeset(data) |> Repo.insert()

    case result do
      {:ok, _} -> {:created}
      _ -> {:error}
    end
  end

  def edit_user(user_id, %{email: email, password: password}) do
    query = from(u in User, where: u.id == ^user_id)
    result = Repo.update_all(query, set: [email: email, password: password])

    case result do
      {1, _} -> {:updated}
      _ -> {:error}
    end
  end

  def delete_user(user_id) do
    result = from(u in User, where: u.id == ^user_id) |> Repo.delete_all()

    case result do
      {1, _} -> {:deleted}
      {0, nil} -> {:error}
      _ -> {:error}
    end
  end
end
