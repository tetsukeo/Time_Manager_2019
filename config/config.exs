# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :timeManager,
  namespace: App,
  ecto_repos: [App.Repo]

# Configures the endpoint
config :timeManager, AppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pXo0ydpg4+dqRLFBc5TyPvRs9tlqFD42CrfTSY4zexak/Cerj8q21odcE/Y5d1KG",
  render_errors: [view: AppWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: App.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
