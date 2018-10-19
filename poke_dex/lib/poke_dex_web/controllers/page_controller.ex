defmodule PokeDexWeb.PageController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, %{"pokeid" => poke_id}) do
    url = "https://pokeapi.co/api/v2/pokemon/#{poke_id}/"
    response = HTTPoison.get!(url)
    pokemon = JSON.decode!(response.body)["forms"] |> List.first

    html conn, """
  <h1>#{pokemon["name"]}</h1>
"""
  end
end
