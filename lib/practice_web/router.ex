defmodule PracticeWeb.Router do
  use PracticeWeb, :router

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

  scope "/", PracticeWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController

    resources "/sessions", SessionController,
      only: [:new, :create, :delete],
      # We don't have to requie a resource ID in the URL because our actions are always scoped to the curent user in the system.
      singleton: true
  end

  scope "/cms", PracticeWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user]

    resources "/pages", PageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PracticeWeb do
  #   pipe_through :api
  # end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()

      user_id ->
        assign(conn, :current_user, Practice.Accounts.get_user!(user_id))
    end
  end
end
