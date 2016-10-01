# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :loupe, Loupe.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "WbPsxbHPggVKf55TsOOZ+EjBlmpw3X5w2lVB0Z1hQ1hhaxV/LacDmfX0i3F/YNCP",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: Loupe.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Loupe",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "this_is_a_secret",
  serializer: Loupe.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
