defmodule Loupe.Router do
  use Loupe.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Loupe do
    pipe_through :api

    resources "/inventory",    InventoryController,   only: [:index, :show, :create, :update, :delete]
    resources "/transactions", TransactionController, only: [:index, :show, :create, :delete]
    resources "/orders",       OrderController,       only: [:index, :show, :create, :delete]

    post "/registrations", RegistrationController, :create

    get "/current_user", CurrentUserController, :show
  end
end
