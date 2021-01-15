defmodule Family.ValidationSchema do
  defmacro __using__(_) do
    quote do
      def validate(data \\ %{}) do
        param = &if is_atom(&1), do: &1, else: String.to_atom(&1)

        if Enum.all?(@required_keys, &Map.has_key?(data, &1)) do
          {:ok}
        else
          {:invalid}
        end
      end
    end
  end
end
