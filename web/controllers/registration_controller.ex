defmodule Loupe.RegistrationController do
  use Loupe.Web, :controller

  alias Loupe.{Registration, Repo, User}

  plug :scrub_params, "user" when action in [:create]

  def index(conn, _params) do
    registrations = Repo.all Registration

    render conn, "index.json", registrations: registrations
  end

  def show(conn, %{"id" => id}) do
    registration = Repo.get Registration, id

    render conn, "show.json", registration: registration
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset %User{}, user_params

    case Repo.insert(changeset) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :token)

        conn
        |> put_status(:created)
        |> render(Loupe.SessionView, "show.json", jwt: jwt, user: user)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Loupe.RegistrationView, "error.json", changeset: changeset)
    end
  end
end
