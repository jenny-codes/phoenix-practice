# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :practice,
  ecto_repos: [Practice.Repo]

# Configures the endpoint
config :practice, PracticeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eJ6ED1h/25h4Dw97zm8ZQ3Mh3CxHaj/vIy4EsmcWYUmOgHoCRzP09m6MuEoJ+Egm",
  render_errors: [view: PracticeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Practice.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "nXwIdUXJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
