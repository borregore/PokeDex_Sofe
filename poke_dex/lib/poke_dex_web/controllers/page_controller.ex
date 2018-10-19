defmodule PokeDexWeb.PageController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, %{"i" => i}) do
    #TODO please kill me
    p = ((("https://pokeapi.co/api/v2/pokemon/#{i}/" |> HTTPoison.get!).body |> JSON.decode!)["forms"] |> List.first) ["name"]
    html conn, """
  <h1>#{p}</h1>
"""
  end

  def pokemon_to_catch(conn, _params) do
    number_pokemon = :rand.uniform(3) + 2

    firstFor = for i<- 1..number_pokemon, do: i

    btnCatch = "<button type=\"button\">Catch!</button>"
    href = "<a href=\"catchit\">Catch!</a>"

    s = Enum.reduce(firstFor, "", fn(time,acc) ->
        random_number = :rand.uniform(802)
        acc <> "<br>Pokemon ##{random_number} is near by. Do you want to catch it?" <> href
    end)

    html conn, s
  end

end
