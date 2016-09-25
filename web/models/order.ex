defmodule Loupe.Order do
  use Loupe.Web, :model

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "orders" do
    field :price, :float
    field :vendor, :string # belongs_to Loupe.Vendor
    field :date_ordered, Ecto.DateTime
    field :date_received, Ecto.DateTime

    has_many :inventory, Loupe.Inventory

    timestamps
  end

  @required_fields ~w(price vendor date_ordered inventory)
  @optional_fields ~w(date_received)

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
