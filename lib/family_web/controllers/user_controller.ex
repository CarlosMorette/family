defmodule FamilyWeb.UserController do
  use FamilyWeb, :controller
  alias FamilyWeb.UserRepository
  alias FamilyWeb.SchemaValidation.CreateUser
  alias FamilyWeb.SchemaValidation.EditUser
  alias FamilyWeb.SchemaValidation.DeleteUser
  import FamilyWeb.ControllerUtils

  defp verify_params(module, body) do
    case module.validate(body) do
      {:ok} -> {:ok, body}
      {:invalid} -> :invalid
    end
  end

  def show(conn, _params) do
    conn |> json(UserRepository.list_all_users())
  end

  def create(conn, _params) do
    case verify_params(CreateUser, conn.body_params) do
      {:ok, body} ->
        case UserRepository.create_user(body) do
          {:ok, _} -> send_success(conn)
          _ -> send_error(conn, :internal_error)
        end

      :invalid ->
        send_error(conn, :bad_request)
    end
  end

  def edit(conn, _params) do
    body = conn.body_params

    case verify_params(EditUser, body) do
      {:ok, body} ->
        case UserRepository.edit_user(body["id"], %{
               email: body["email"],
               password: body["password"]
             }) do
          {1, _} -> send_success(conn)
          _ -> send_error(conn, :internal_error)
        end

      :invalid ->
        send_error(conn, :bad_request)
    end
  end

  def delete(conn, _params) do
    body = conn.body_params

    case verify_params(DeleteUser, body) do
      {:ok, body} ->
        case UserRepository.delete_user(body["id"]) do
          {1, _} -> send_success(conn)
          _ -> send_error(conn, :internal_error)
        end

      :invalid ->
        send_error(conn, :bad_request)
    end
  end
end
