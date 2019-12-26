defmodule TwitterFeed.TwitterApi.UrlBuilderTest do
  use ExUnit.Case, async: true

  alias TwitterFeed.TwitterApi.UrlBuilder

  test "building the handle url" do
    url = UrlBuilder.build_html_url("CandyCrushSaga")

    assert url == "https://twitter.com/CandyCrushSaga"
  end

  test "building the json url" do

    expected_url = "https://twitter.com/i/profiles/show/CandyCrushSaga/timeline/tweets?include_available_features=1&include_entities=1&max_position=4&reset_error_state=false"

    url = UrlBuilder.build_json_url("CandyCrushSaga", 4)

    assert url == expected_url
  end
end
