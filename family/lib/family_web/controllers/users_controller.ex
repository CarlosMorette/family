defmodule FamilyWeb.UsersController do
  use FamilyWeb, :controller
  alias FamilyWeb.UsersRepository
  def show(conn, _params) do



    conn |> json(UsersRepository.list_all_users())
  end
end
