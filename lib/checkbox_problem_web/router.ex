defmodule CheckboxProblemWeb.Router do
  use CheckboxProblemWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Phoenix.LiveView.Flash
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CheckboxProblemWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/checkbox", CheckboxLive
    live "/checkbox/:id", CheckboxLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", CheckboxProblemWeb do
  #   pipe_through :api
  # end
end
