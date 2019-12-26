defmodule TwitterFeedWeb.PageController do
  use TwitterFeedWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
