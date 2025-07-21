defmodule WebAdminWeb.Router do
  use WebAdminWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WebAdminWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebAdminWeb do
    pipe_through :browser

    live "/", HomeLive
  end

  # Enable LiveDashboard in all environments
  import Phoenix.LiveDashboard.Router

  scope "/dev" do
    pipe_through :browser

    live_dashboard "/dashboard", metrics: WebAdminWeb.Telemetry
  end
end
