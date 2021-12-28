defmodule SsmsgWeb.FallbackController do
  use SsmsgWeb, :controller

  alias SsmsgWeb.ChangesetView

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> json(%{error: "not found"})
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, _) do
    conn
    |> put_status(:internal_server_error)
    |> json(%{errro: "Something went wrong"})
  end

end
