defmodule TwitterFeed do
  @moduledoc """
  Provides an API to retrieve Tweets from a Twitter feed.

  Contains a single method "get_tweets".
  """

  @doc """
  Retrieves the tweets posted to a paticular twitter feed.

  ## Parameters

    - handle: a string representing the twitter handle to retrieve tweets from.
    - tweet_id: an optional integer parameter
    - start_after_tweet: an optional integer parameter that defaults to 0.
        When 0 will retrieve tweets starting from the most
        recently posted tweet.  When populated with a
        tweet id, will retrieve tweets starting from the first tweet posted
        after the passed in tweet id.

  ## Returns

    - {:error, reason} - on an invalid request (i.e. a handle that does not exist).
    - {:ok, %TwitterFeed.Feed} - on a valid request.

  ## Examples

    TwitterFeed.get_tweets("CandyCrushSaga")
      {:ok, %TwitterFeed.Feed{last_tweet_retrieved: 966417486722863104,
                            more_tweets_exist: true,
                            tweets: [...]}

    To scrape handle status and tweet comments you will need to pass
    tweet_id to the scapper:

    TwitterFeed.get_tweets("CandyCrushSaga", 1207617229082288128)
      {:ok, %TwitterFeed.Feed{tweet: [...]}}

    To then get the 2nd page of results use the
    start_after_tweet value from the 1st request:

    TwitterFeed.get_tweets("CandyCrushSaga", 966417486722863104)
      {:ok, %TwitterFeed.Feed{last_tweet_retrieved: 965316001540788224,
                            more_tweets_exist: true,
                            tweets: [...]}
  """
  defdelegate get_tweets(handle, start_after_tweet \\ 0),
      to: TwitterFeed.Scraper, as: :scrape
end
