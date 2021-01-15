defmodule FamilyWeb.SchemaValidation.EditUser do
  @required_keys ["id", "email", "password"]
  use Family.ValidationSchema
end
