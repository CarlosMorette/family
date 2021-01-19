defmodule Family.Migrations.AddUserTable do
  use Ecto.Migration

  # creating migration to db
  # run -> $ mix ecto.migrate
  def up do
    create table("users") do
      add :name, :string
      add :email, :string
      add :age, :integer
      add :password, :string

      # Adds :inserted_at and :updated_at timestamp columns.
      timestamps()
    end
  end
end
