defmodule Loupe.Session do
  alias Loupe.{Repo, User}

  def authenticate(%{"email" => email, "password" => password}) do
    user = Repo.get_by User, email: String.downcase(email)

    case check_password(user, password) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp check_password(nil, password), do: false
  defp check_password(%{"encrypted_password" => encrypted_password}, password) do
    Comeonin.Bcrypt.checkpw(password, encrypted_password)
  end
end
