defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1[:price]))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(is_nil(&1[:price])))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn map ->
      Map.update!(map, :name, fn name ->
        String.replace(name, old_word, new_word)
        end)
      end)
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size, fn {size, quantity} -> {size, quantity + count} end)}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_, quantity}, acc -> quantity + acc end)
  end
end
