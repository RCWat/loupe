defmodule Loupe.InventoryController do
  use Loupe.Web, :controller
  alias Loupe.Inventory

  def index(conn, _params) do
    inventory = Repo.all Inventory

    render conn, "index.json", inventory: inventory
  end

  def show(conn, %{"id" => id}) do
    inventory = Repo.get! Inventory, id

    render conn, "show.json", inventory: inventory
  end

  def create(conn, %{"inventory" => inventory_params}) do
    changeset = Inventory.changeset %Inventory{}, inventory_params

    case Repo.insert changeset do
      {:ok, _inventory}    -> json conn, "ok"
      {:error, _changeset} -> json conn, "error"
    end
  end

  def update(conn, %{"id" => id, "inventory" => inventory_params}) do
    inventory = Repo.get! Inventory, id
    changeset = Inventory.changeset inventory, inventory_params

    case Repo.update(changeset) do
      {:ok, inventory}    ->
        render conn, "show.json", inventory: inventory

      {:error, changeset} ->
        render conn, "error.json", %{error: changeset.errors}
    end
  end

  def delete(conn, %{"id" => id}) do
    inventory = Repo.get! Inventory, id

    Repo.delete! inventory

    json conn, "ok"
  end
end
