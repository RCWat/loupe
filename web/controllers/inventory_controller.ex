defmodule Loupe.InventoryController do
  use Loupe.Web, :controller
  alias Loupe.Inventory

  def index(conn, _params) do
    inventory = Repo.all Inventory

    json conn, %{data: inventory}
  end

  def show(conn, %{"id" => id}) do
    inventory = Repo.get! Inventory, id

    json conn, %{data: inventory}
  end

  def create(conn, %{"inventory" => inventory_params}) do
    changeset = Inventory.changeset %Inventory{}, inventory_params

    case Repo.insert changeset do
      {:ok, _inventory}    -> json conn, "ok"
      {:error, _changeset} -> json conn, "error"
    end
  end

  def delete(conn, %{"id" => id}) do
    inventory = Repo.get! Inventory, id

    Repo.delete! inventory

    json conn, "ok"
  end
end
