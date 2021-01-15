defmodule FamilyWeb.UsersController do
  use FamilyWeb, :controller
  alias FamilyWeb.UsersRepository
  alias FamilyWeb.SchemaValidation.CreateUser
  alias FamilyWeb.SchemaValidation.EditUser

  # TODO: Criar maneira de fazer as respostas do controller

  def show(conn, _params) do
    conn |> json(UsersRepository.list_all_users())
  end

  defp verify_params_to_create_user(body) do
    case CreateUser.validate(body) do
      {:ok} -> {:ok, body}
      {:invalid} -> :invalid
    end
  end

  defp verify_params_to_edit_user(body) do
    case EditUser.validate(body) do
      {:ok} -> {:ok, body}
      {:invalid} -> :invalid
    end
  end

  def create(conn, _params) do
    case verify_params_to_create_user(conn.body_params) do
      {:ok, body} ->
        case UsersRepository.create_user(body) do
          {:ok, _} -> conn |> json(%{ok: "deu bom"})
        end

      :invalid ->
        conn |> put_status(:bad_request) |> json(%{error: "invalid body"})
    end
  end

  def edit(conn, _params) do
    body = conn.body_params

    case verify_params_to_edit_user(body) do
      {:ok, body} ->
        case UsersRepository.edit_a_user(body["id"], %{
               email: body["email"],
               password: body["password"]
             }) do
          {1, _} -> conn |> json(%{ok: "deu bom atualizar"})
        end

      :invalid ->
        conn |> put_status(:bad_request) |> json(%{error: "invalid body"})
    end
  end
end
