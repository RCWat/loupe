defmodule Loupe.Inventory do
  use Loupe.Web, :model

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "inventory" do
    field :name, :string
    field :quantity, :integer
    field :group_id, :string
    field :serial_number, :string
    field :description, :string
    field :department, :string # TODO: Loupe.Department?
    field :type, :string
    field :metal, :string
    field :stone, :string
    field :size, :float
    field :wholesale_price, :integer
    field :retail_price, :integer
    field :image_url, :string

    belongs_to :order, Loupe.Order

    timestamps
  end

  @required_fields ~w(name quantity retail_price)
  @optional_fields ~w(group_id serial_number description department type
                      metal stone size wholesale_price image_url order_id)

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
