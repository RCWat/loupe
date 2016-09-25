defmodule Loupe.InventoryView do
  use Loupe.Web, :view

  def render("index.json", %{inventory: inventory}) do
    %{data: render_many(inventory, __MODULE__, "inventory.json")}
  end

  def render("show.json", %{inventory: inventory}) do
    %{data: render_one(inventory, __MODULE__, "inventory.json")}
  end

  def render("inventory.json", %{inventory: inventory}) do
    %{
      id: inventory.id,
      description: inventory.description,
      price: inventory.retail_price
    }
  end
end
