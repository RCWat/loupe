defmodule Loupe.Repo.Migrations.AddTransactionId do
  use Ecto.Migration

  def change do
    alter table(:inventory) do
      add :transaction_id, references(:transactions)
    end
  end
end
