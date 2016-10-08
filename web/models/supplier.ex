defmodule Loupe.Supplier do
  use Loupe.Web, :model

  schema "suppliers" do
    field :name, :string
    field :email, :string
    field :phone, :integer
    field :fax, :integer

    has_many :orders, Loupe.Order

    timestamps
  end
end
