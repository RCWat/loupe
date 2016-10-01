defmodule Loupe.RegistrationView do
  use Loupe.Web, :view

  def render("error.json", %{changeset: changeset}) do
    %{errors: changeset.errors}
  end
end
