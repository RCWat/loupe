defmodule Loupe.Inventory do
  use Loupe.Web, :model

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "inventory" do
    field :name, :string
    field :quantity, :integer
    field :group_id, :string
    field :serial_number, :string
    field :description, :string
    field :metal, :string
    field :stone, :string
    field :carat, :float
    field :clarity, :string
    field :cut, :string
    field :length, :integer
    field :size, :float
    field :style_number, :integer
    field :wholesale_price, :integer
    field :retail_price, :integer
    field :image_url, :string

    belongs_to :order, Loupe.Order

    timestamps
  end

  @required_fields ~w(name quantity group_id serial_number retail_price)
  @optional_fields ~w(description metal stone carat clarity cut length
                      size style_number wholesale_price image_url order_id)

  def changeset(model, params) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
