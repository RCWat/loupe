defmodule Loupe.TransactionController do
  use Loupe.Web, :controller
  alias Loupe.Transaction

  def index(conn, _params) do
    transaction = Repo.all Transaction

    json conn, %{data: transaction}
  end

  def show(conn, %{"id" => id}) do
    transaction = Repo.get! Transaction, id

    json conn, %{data: transaction}
  end

  def create(conn, %{"transaction" => transaction_params}) do
    changeset = Transaction.changeset %Transaction{}, transaction_params

    case Repo.insert changeset do
      {:ok, transaction} ->
        json conn, "ok"

      {:error, _changeset} ->
        json conn, "error"
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Repo.get! Transaction, id

    Repo.delete! transaction

    json conn, "ok"
  end
end
