defmodule Family.Env do
  def get(key) do
    Dotenv.load()
    |> Map.from_struct()
    |> Map.get(:values)
    |> Map.get(key)
  end

  def get_user, do: get("USER")

  def get_password, do: get("PASSWORD")
end
