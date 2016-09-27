defmodule Loupe.OrderView do
  use Loupe.Web, :view

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, __MODULE__, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, __MODULE__, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      price: order.price,
      date_ordered: order.date_ordered,
      date_received: order.date_received
    }
  end
end
