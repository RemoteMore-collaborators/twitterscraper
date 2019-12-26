ExUnit.start(exclude: [:skip])
Ecto.Adapters.SQL.Sandbox.mode(TwitterFeed.Repo, :manual)
Code.require_file("test/mocks/twitter_api_mock.ex")
