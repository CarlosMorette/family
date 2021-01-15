defmodule FamilyWeb.UsersRepository do
  import Ecto.Query
  alias Family.Repo
  alias Family.Schemas.Users

  def create_user(data) do
    %Users{} |> Users.changeset(data) |> Repo.insert()
  end

  def list_all_users() do
    query = from u in Users, select: %{name: u.name, email: u.email, age: u.age, id: u.id}
    Repo.all(query)
  end

  def edit_a_user(user_id, %{email: email, password: password}) do
    query = from(u in Users, where: u.id == ^user_id)
    Repo.update_all(query, set: [email: email, password: password])
  end

  def delete_a_user(user_id) do
    from(u in Users, where: u.id == ^user_id) |> Repo.delete_all()
  end
end
