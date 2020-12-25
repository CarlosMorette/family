defmodule Family.Schemas.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    # field :user_id, Ecto.UUID, autogenerate: true
    field :name, :string
    field :email, :string
    field :age, :integer

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :age])
  end
end
