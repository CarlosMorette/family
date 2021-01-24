defmodule FamilyWeb.Utils.Controller do
  import Phoenix.Controller, only: [json: 2]
  import Plug.Conn

  def success(conn, overrides \\ %{}) do
    conn
    |> put_status(:ok)
    |> json(Map.merge(%{:status => :ok}, overrides))
  end
end
