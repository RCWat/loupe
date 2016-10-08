defmodule Loupe.Order do
  use Loupe.Web, :model

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "orders" do
    field :price, :integer
    field :date_ordered, Ecto.DateTime
    field :date_received, Ecto.DateTime

    belongs_to :supplier, Loupe.Supplier

    has_many :inventory, Loupe.Inventory

    timestamps
  end

  @required_fields ~w(price supplier date_ordered)
  @optional_fields ~w(date_received)

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
