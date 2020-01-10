defmodule SpreadSheet do
  alias TwitterFeed

  def map_fetch_tweet(handle, start_after_tweet \\ 0) do

    fetch_t =
      TwitterFeed.get_tweets(handle, start_after_tweet)

    # Map tweets
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

  def enum_fetch_tweet(handle) do

    fetch_t =
      TwitterFeed.get_tweets(handle)

    get_tweet_id =
      Enum.each(fetch_t.tweets, fn t -> TwitterFeed.get_tweets(handle, t.tweet_id) end)

    {:ok, get_tweet_id}
  end

  def save_to_spreadsheet(handle) do
    {:ok, pid} = GSS.Spreadsheet.Supervisor.spreadsheet("1XvvLVKqmFEdipxB5uX8Sp0tIAzEevI_F9xeZ1iq1Y1s", list_name: "StatusTweet")

    save_to_candy =
      ExTwitter.search(handle, [count: 100])
        |> Enum.with_index(1)
        |> Enum.each(fn {tweet, index} ->
          GSS.Spreadsheet.append_row(pid, index,
            [tweet.text]
          )
        end)

    {:ok, save_to_candy}
  end
end
