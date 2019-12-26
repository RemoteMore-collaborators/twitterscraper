use Mix.Config

# Configure your database
config :twitter_feed, TwitterFeed.Repo,
  username: "postgres",
  password: "postgres",
  database: "twitter_feed_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :twitter_feed, TwitterFeedWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :twitter_feed, :twitter_api, TwitterFeed.Mocks.TwitterApiMock
