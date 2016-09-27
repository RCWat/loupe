defmodule Loupe.TransactionView do
  use Loupe.Web, :view

  def render("index.json", %{transactions: transactions}) do
    %{data: render_many(transactions, __MODULE__, "transaction.json")}
  end

  def render("show.json", %{transaction: transaction}) do
    %{data: render_one(transaction, __MODULE__, "transaction.json")}
  end

  def render("transaction.json", %{transaction: transaction}) do
    %{
      id: transaction.id,
      buyer: transaction.buyer,
      price: transaction.price
    }
  end
end
