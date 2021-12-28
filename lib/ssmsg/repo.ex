defmodule Ssmsg.Repo do
  use Ecto.Repo,
    otp_app: :ssmsg,
    adapter: Ecto.Adapters.Postgres
end
