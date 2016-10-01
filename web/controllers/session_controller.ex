defmodule Loupe.SessionController do
  use Loupe.Web, :controller

  plug :scrub_params, "session" when action in [:create]

  def create(conn, %{"session" => session_params}) do
    case Loupe.Session.authenticate(session_params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign user, :token

        conn
        |> put_status(:created)
        |> render("show.json", jwt: jwt, user: user)

      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> render(Loupe.SessionView, "forbidden.json", error: "Not authenticated.")
  end
end
