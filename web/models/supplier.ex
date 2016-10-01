defmodule Loupe.Supplier do
  use Loupe.Web, :model

  schema "suppliers" do
    field :name, :string

    has_many :users, Loupe.User

    timestamps
  end
end
