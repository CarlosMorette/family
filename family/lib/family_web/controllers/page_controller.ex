defmodule FamilyWeb.PageController do
  use FamilyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
