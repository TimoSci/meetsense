# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :meetsense,
  ecto_repos: [Meetsense.Repo]

# Configures the endpoint
config :meetsense, Meetsense.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TJuUv16K12HqP+moTOpLFQKx8mY8Lq2AZ87sz/FXDIo1bkTLF9a1kJHNDSY1dtDG",
  render_errors: [view: Meetsense.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Meetsense.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
