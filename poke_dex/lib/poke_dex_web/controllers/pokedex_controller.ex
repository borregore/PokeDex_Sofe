defmodule PokeDexWeb.PokedexController do
  use PokeDexWeb, :controller

  def start(conn, _params) do
    count = 1
    html = "<h1>Pokedex</h1>"
    pokedex(conn, count, html)
  end

  def pokedex(conn, poke_id, template) when is_integer(poke_id) do
    if poke_id <= 15 do
      url = "https://pokeapi.co/api/v2/pokemon/#{poke_id}/"
      response = HTTPoison.get!(url)
      pokemon = JSON.decode!(response.body)["forms"] |> List.first
      template = template <> "<h2>##{poke_id} #{pokemon["name"]}</h2>"
      poke_id = poke_id+1
      pokedex(conn, poke_id, template)
    else
      html conn, template
    end
  end
end
