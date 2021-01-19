defmodule FamilyWeb.SchemaValidation.CreateUser do
  @required_keys ["name", "email", "age", "password"]
  use Family.ValidationSchema
end
