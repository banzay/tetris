defmodule TetrisWeb.Router do
  use TetrisWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TetrisWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/snake", SnakeLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", TetrisWeb do
  #   pipe_through :api
  # end
end
