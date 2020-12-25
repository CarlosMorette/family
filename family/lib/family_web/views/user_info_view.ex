defmodule FamilyWeb.UserInfoView do
  use FamilyWeb, :view

  def render("user_info.json", %{name: name, email: email, age: age}) do
    %{
      name: name,
      email: email,
      age: age
    }
  end
end
