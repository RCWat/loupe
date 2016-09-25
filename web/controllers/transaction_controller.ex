defmodule Loupe.TransactionController do
  use Loupe.Web, :controller
  alias Loupe.Transaction

  def index(conn, _params) do
    transactions = Repo.all Transaction

    render conn, "index.json", transactions: transactions
  end

  def show(conn, %{"id" => id}) do
    transaction = Repo.get! Transaction, id

    render conn, "show.json", transaction: transaction
  end

  def create(conn, %{"transaction" => transaction_params}) do
    changeset = Transaction.changeset %Transaction{}, transaction_params

    case Repo.insert changeset do
      {:ok, _transaction}  -> json conn, "ok"
      {:error, _changeset} -> json conn, "error"
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Repo.get! Transaction, id

    Repo.delete! transaction

    json conn, "ok"
  end
end
