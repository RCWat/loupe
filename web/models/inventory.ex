defmodule Loupe.Inventory do
  use Loupe.Web, :model

  schema "inventory" do
    field :name, :string
    field :group_id, :string
    field :serial_number, :string
    field :description, :string
    field :department, :string # TODO: Loupe.Department?
    field :type, :string
    field :metal, :string
    field :stone, :string
    field :size, :float
    field :wholesale_price, :float
    field :retail_price, :float
    field :quantity, :integer
    field :image_url, :string

    belongs_to :order_id, Loupe.Order

    timestamps
  end

  @required_fields ~w(name unit_price quantity department)
  @optional_fields ~w()

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
