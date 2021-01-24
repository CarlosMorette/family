defmodule FamilyWeb.UserController do
  use FamilyWeb, :controller

  alias FamilyWeb.UserRepository
  alias FamilyWeb.SchemaValidation.CreateUser
  alias FamilyWeb.SchemaValidation.EditUser
  alias FamilyWeb.SchemaValidation.DeleteUser
  alias FamilyWeb.Errors

  import FamilyWeb.Utils.Controller

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
          {:created} -> success(conn)
          {:error} -> Errors.internal_error(conn)
        end

      :invalid ->
        Errors.bad_request(conn, "invalid payload")
    end
  end

  def edit(conn, _params) do
    body = conn.body_params

    case verify_params(EditUser, body) do
      {:ok, body} ->
        data = %{email: body["email"], password: body["password"]}

        case UserRepository.edit_user(body["id"], data) do
          {:updated} -> success(conn)
          {:error} -> Errors.internal_error(conn)
        end

      :invalid ->
        Errors.bad_request(conn, "invalid payload")
    end
  end

  def delete(conn, _params) do
    body = conn.body_params

    case verify_params(DeleteUser, body) do
      {:ok, body} ->
        id = body["id"]

        case UserRepository.delete_user(id) do
          {:deleted} -> success(conn)
          {:error} -> Errors.internal_error(conn)
        end

      :invalid ->
        Errors.bad_request(conn, "invalid payload")
    end
  end
end
