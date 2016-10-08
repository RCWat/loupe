defmodule Loupe.Repo.Migrations.UpdateTables do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :notes, :string
      add :customer_email, :string
    end

    alter table(:inventory) do
      add :carat, :float
      add :clarity, :string
      add :cut, :string
      add :length, :integer
      add :style_number, :integer
      remove :department
      remove :type
    end

    alter table(:suppliers) do
      add :email, :string
      add :phone, :integer
      add :fax, :integer
    end
  end
end
