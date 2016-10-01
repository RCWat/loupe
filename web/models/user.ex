defmodule Loupe.User do
  use Loupe.Web, :model

  @derive {Poison.Encoder, only: [:id, :first_name, :last_name, :company, :email]}

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :company, :string
    field :email, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string

    timestamps
  end

  @required_fields ~w(first_name last_name company email password)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password, message: "Password does not match")
    |> unique_constraint(:email, message: "This email is already associated with an account.")
    |> generate_encrypted_password
  end

  defp generate_encrypted_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :encrypted_password, encrypt(password))

      _ -> changeset
    end
  end

  defp encrypt(password), do: Comeonin.Bcrypt.hashpwsalt password
end
