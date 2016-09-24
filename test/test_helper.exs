ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Loupe.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Loupe.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Loupe.Repo)

