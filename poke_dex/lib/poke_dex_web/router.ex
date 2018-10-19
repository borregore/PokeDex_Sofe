defmodule PokeDexWeb.Router do
  use PokeDexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PokeDexWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/search", PageController, :search
    get "/pokedex", PokedexController, :start
    get "/catch", PageController, :pokemon_to_catch
  end


  # Other scopes may use custom stacks.
  # scope "/api", PokeDexWeb do
  #   pipe_through :api
  # end
end
