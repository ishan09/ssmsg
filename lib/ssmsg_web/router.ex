defmodule SsmsgWeb.Router do
  use SsmsgWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SsmsgWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SsmsgWeb do
    pipe_through :api

    post "/message", MessageController, :add
    get "/message/:email", MessageController, :get
  end

end
