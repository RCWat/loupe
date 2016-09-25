defmodule Loupe.OrderController do
  use Loupe.Web, :controller
  alias Loupe.Order

  def index(conn, _params) do
    orders = Repo.all Order

    render conn, "index.json", orders: orders
  end

  def show(conn, %{"id" => id}) do
    order = Repo.get! Order, id

    render conn, "show.json", order: order
  end

  def create(conn, %{"order" => order_params}) do
    changeset = Order.changeset %Order{}, order_params

    case Repo.insert changeset do
      {:ok, _order}        -> json conn, "ok"
      {:error, _changeset} -> json conn, "error"
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Repo.get! Order, id

    Repo.delete! order

    json conn, "ok"
  end
end