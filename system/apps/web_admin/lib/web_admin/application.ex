defmodule WebAdmin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WebAdmin.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:web_admin, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:web_admin, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WebAdmin.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: WebAdmin.Finch}
      # Start a worker by calling: WebAdmin.Worker.start_link(arg)
      # {WebAdmin.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: WebAdmin.Supervisor)
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
