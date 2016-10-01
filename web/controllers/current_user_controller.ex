defmodule Loupe.CurrentUserController do
  use Loupe.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: Loupe.SessionController

  def show(conn, _params) do
    user = Guardian.Plug.current_resource conn

    conn
    |> put_status(:ok)
    |> render("show.json", user: user)
  end
end
