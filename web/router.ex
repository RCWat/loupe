defmodule Loupe.Router do
  use Loupe.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Loupe do
    pipe_through :api
  end
end
