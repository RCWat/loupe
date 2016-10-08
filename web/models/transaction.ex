defmodule Loupe.Transaction do
  use Loupe.Web, :model

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "transactions" do
    field :price, :integer
    field :notes, :string
    field :customer_email, :string

    has_many :inventory, Loupe.Inventory

    timestamps
  end

  @required_fields ~w(item price)
  @optional_fields ~w(customer_name customer_name notes)

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
