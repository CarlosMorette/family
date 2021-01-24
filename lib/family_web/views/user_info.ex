defmodule FamilyWeb.UserView do
  use FamilyWeb, :view

  def render("user_info.json", %{name: name, email: email}) do
    %{
      name: name,
      email: email
    }
  end
end
