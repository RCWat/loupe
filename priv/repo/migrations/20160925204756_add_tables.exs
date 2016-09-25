defmodule Loupe.Repo.Migrations.AddTables do
  use Ecto.Migration

  def change do
    create table(:inventory) do
      add :name, :string
      add :quantity, :integer
      add :group_id, :string
      add :serial_number, :string
      add :description, :string
      add :department, :string # TODO: Loupe.Department?
      add :type, :string
      add :metal, :string
      add :stone, :string
      add :size, :float
      add :wholesale_price, :integer
      add :retail_price, :integer
      add :image_url, :string

      add :order_id, :integer

      timestamps
    end

    create table(:orders) do
      add :price, :float
      add :vendor_id, :integer # belongs_to Loupe.Vendor
      add :date_ordered, :datetime
      add :date_received, :datetime

      timestamps
    end

    create table(:transactions) do
      add :buyer_id, :integer # TODO: should belongs_to a user
      add :seller_id, :integer # TODO: see above
      add :item, :string
      add :price, :integer

      timestamps
    end
  end
end
