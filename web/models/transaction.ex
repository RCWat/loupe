defmodule Loupe.Transaction do
  use Loupe.Web, :model

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "transactions" do
    field :buyer, :string # TODO: should belongs_to a user
    field :seller, :string # TODO: see above
    field :item, :string
    field :price, :integer

    timestamps
  end

  @required_fields ~w(buyer seller item price)
  @optional_fields ~w()

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
