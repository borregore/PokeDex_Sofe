defmodule PokeDexWeb.PageController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
