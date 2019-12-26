defmodule TwitterFeed.ScaperTest do
  use ExUnit.Case, async: true

  alias TwitterFeed.{ Scraper }

  test "scaping on non-existant handle will return 404" do
    {:error, reason} = Scraper.scrape(:non_existant_handle, 0)

    assert reason =~ "404 error, that handle does not exist"
  end

  test "scraping will fail when start_after_tweet < 0" do
    {:error, reason} = Scraper.scrape("someTwitterHandle", -1)

    assert reason =~ "invalid start_after_tweet argument, can't be < 0"
  end
end
