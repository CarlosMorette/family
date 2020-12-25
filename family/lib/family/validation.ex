defmodule Family.Validation do

  def check_keys_on_the_map(required_keys, map) when is_list(required_keys) and is_map(map) do
    param = &(if is_atom(&1), do: &1, else: String.to_atom(&1))
    Enum.all?(required_keys, &(Map.has_key?(map, param.(&1))))
  end
end
