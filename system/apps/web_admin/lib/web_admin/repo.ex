defmodule WebAdmin.Repo do
  use Ecto.Repo,
    otp_app: :web_admin,
    adapter: Ecto.Adapters.SQLite3
end
