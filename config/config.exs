# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :twitter_feed,
  ecto_repos: [TwitterFeed.Repo]

# Configures the endpoint
config :twitter_feed, TwitterFeedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Dn+j80rzn8HYdxtx0RBFJcnNeCsBXpVTD6TFuma5VvU8mJtFw78zU/Sxm+Nhpqxj",
  render_errors: [view: TwitterFeedWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TwitterFeed.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :goth, json: File.read!("./config/service_account.json")

config :elixir_google_spreadsheets, :client,
  request_workers: 50,
  max_demand: 100,
  max_interval: :timer.minutes(1),
  interval: 100

config :twitter_feed, TwitterFeed.Scheduler,
jobs: [
  {"10 22 * * *", fn -> SpreadSheet.save_to_spreadsheet("CandyCrushSaga") end},
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
