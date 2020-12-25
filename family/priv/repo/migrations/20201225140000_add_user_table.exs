defmodule Family.Migrations.AddUserTable do
  use Ecto.Migration

  # creating migration to db
  # run
  # $ mix ecto.migrate
  def up do
    create table("users") do
      add :user_id, :string
      add :name, :string
      add :email, :string
      add :age, :integer

      timestamps()
    end

    create unique_index("users", [:user_id])
  end
end
