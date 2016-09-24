defmodule Loupe.Inventory do
  use Loupe.Web, :model

  schema "inventory" do
    field :name, :string
    field :unit_price, :float
    field :quantity, :integer
    field :department, :string
    field :vendor, :string # TODO: should belongs_to a Loupe.Vendor
  end

  @required_fields ~w(name unit_price quantity department)
  @optional_fields ~w()

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
