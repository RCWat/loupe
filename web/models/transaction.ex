defmodule Loupe.Transaction do
  use Loupe.Web, :model

  schema "transactions" do
    field :buyer, :string # TODO: should belongs_to a user
    field :seller, :string # TODO: see above
    field :item, :string
    field :price, :float

    timestamps
  end

  @required_fields ~w(buyer seller item price)
  @optional_fields ~w()

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
