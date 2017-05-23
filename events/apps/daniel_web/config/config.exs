# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :daniel_web, DanielWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QZtZRJF4pnMgNqAY0LSVrsldEChHca1wsrs6iRu0V3OvaDyn74FkfcB8w3gZTJVD",
  render_errors: [view: DanielWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DanielWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
