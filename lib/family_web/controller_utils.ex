defmodule FamilyWeb.ControllerUtils do
  import Phoenix.Controller, only: [json: 2]
  import Plug.Conn

  def send_success(conn, overrides \\ %{}) do
    conn
    |> put_status(:ok)
    |> json(Map.merge(%{:status => :ok}, overrides))
  end

  def send_error(conn, status_code, overrides \\ %{}) do
    conn
    |> put_status(status_code)
    |> json(Map.merge(%{:status => :error}, overrides))
  end
end
