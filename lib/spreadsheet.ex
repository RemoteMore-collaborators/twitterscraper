defmodule SpreadSheet do
  alias TwitterFeed

  def fetch_tweet(handle, start_after_tweet \\ 0) do

    fetch_t =
      TwitterFeed.get_tweets(handle, start_after_tweet)

    clean =
      Enum.map(fetch_t.tweets, fn t ->
        %{
          handle_id: t.handle_id,
          tweet_id: t.tweet_id,
          user_id: t.user_id,
          tweet_lng: t.tweet_lng,
          username: t.user_name,
          display_name: t.display_name,
          timestamp: t.timestamp,
          text_summary: t.text_summary,
          image: t.image_url,
        }
      end)

    {:ok, clean}
  end

  def save_to_spreadsheet(handle, start_after_tweet \\ 0) do
    {:ok, pid} = GSS.Spreadsheet.Supervisor.spreadsheet("1XvvLVKqmFEdipxB5uX8Sp0tIAzEevI_F9xeZ1iq1Y1s", list_name: "candy")

    fetch_tweets =
      TwitterFeed.get_tweets(handle, start_after_tweet)

    save_to_candy =
    fetch_tweets.tweets
      |> Enum.with_index(1)
      |> Enum.each(fn {tweet, index} ->
        GSS.Spreadsheet.append_row(pid, index,
          [ tweet.handle_id,
            tweet.tweet_id,
            tweet.user_id,
            tweet.tweet_lng,
            tweet.user_name,
            tweet.display_name,
            tweet.timestamp,
            tweet.text_summary,
            tweet.image_url,
          ]
         )
    end)

    {:ok, save_to_candy}
  end
end
