# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hw06,
  ecto_repos: [Hw06.Repo]

# Configures the endpoint
config :hw06, Hw06Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Fi4h8LOLuxZt6fWtumKLHuHJ/eSFfcOlCR6hDNnO36SqBRAiwcbBn35ojMj06kRS",
  render_errors: [view: Hw06Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hw06.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
