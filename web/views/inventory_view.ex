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
      name: inventory.name,
      quantity: inventory.quantity,
      group_id: inventory.group_id,
      serial_number: inventory.serial_number,
      description: inventory.description,
      metal: inventory.metal,
      stone: inventory.stone,
      size: inventory.size,
      wholesale_price: inventory.wholesale_price,
      retail_price: inventory.retail_price,
      image_url: inventory.image_url,
      inserted_at: inventory.inserted_at,
      updated_at: inventory.updated_at,
    }
  end
end
