defmodule FamilyWeb.Errors do
  import Plug.Conn
  import Phoenix.Controller, only: [json: 2]

  defp return_error(conn, status_code, message \\ "") do
    conn
    |> put_status(status_code)
    |> json(%{error: message})
    |> halt()
  end

  def unauthorized(conn, message \\ "authentication required") do
    conn
    |> return_error(:unauthorized, message)
  end

  def internal_error(conn, message \\ "internal error") do
    conn
    |> return_error(500, message)
  end

  def bad_request(conn, message \\ "bad request") do
    conn
    |> return_error(400, message)
  end
end
