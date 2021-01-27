defmodule FamilyWeb.Plugs.BasicAuth do
  import Plug.Conn
  alias FamilyWeb.Errors
  alias Family.Env

  defp decode_auth(base64) do
    {:ok, user} = Base.decode64(base64)

    user
    |> String.split(":")
  end

  defp debug_auth(auth) do
    [_, user] = auth |> String.split(" ")
    decode_auth(user)
  end

  def get_credentials_in_env([name, password]) do
    case Env.get_user() === name and Env.get_password() === password do
      true -> {:ok, %{name: name, password: password}}
      false -> {:invalid_user}
    end
  end

  def init(options), do: options

  def call(conn, _opts) do
    case get_req_header(conn, "authorization") do
      [] ->
        conn |> Errors.unauthorized()

      [header] ->
        result = debug_auth(header) |> get_credentials_in_env()

        case result do
          {:ok, user} -> conn |> assign(:authorized_user, user)
          {:invalid_user} -> Errors.unauthorized(conn, "invalid user")
        end
    end
  end
end
