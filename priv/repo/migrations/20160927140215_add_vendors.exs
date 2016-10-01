defmodule Loupe.Repo.Migrations.AddVendors do
  use Ecto.Migration

  def change do
    create table(:suppliers) do
      add :name, :string

      timestamps
    end

    alter table(:orders) do
      remove :vendor_id
      add :supplier_id, references(:suppliers)
      modify :price, :integer
    end

    alter table(:transactions) do
      remove :seller_id
      remove :buyer_id
      remove :item
      add :item_id, references(:inventory)
    end
  end
end
