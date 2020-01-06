defmodule TwitterFeed.TwitterApi.Api do
  @callback get_home_page(handle :: String.t) :: String.t
  @callback get_status_page(handle :: String.t, tweet_id :: Integert.t) :: String.t
  @callback get_tweets(handle :: String.t, last_tweet_retrieved :: Integer.t) :: String.t
end
