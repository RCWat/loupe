defmodule Loupe.Transaction do
  use Loupe.Web, :model

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "transactions" do
    field :price, :integer

    belongs_to :item, Loupe.Inventory

    timestamps
  end

  @required_fields ~w(item price)
  @optional_fields ~w()

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
