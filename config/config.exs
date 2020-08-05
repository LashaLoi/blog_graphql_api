# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blog_graphql_api,
  ecto_repos: [BlogGraphqlApi.Repo]

# Configures the endpoint
config :blog_graphql_api, BlogGraphqlApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8u9pv0R08i4vxQ3bJ/iPjPmAru1yTg0WtN3Eoc3cDI9iMKGeSQovRJzU1VG5Z4v3",
  render_errors: [view: BlogGraphqlApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BlogGraphqlApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
