defmodule SsmsgWeb.MessageController do
  use SsmsgWeb, :controller
  alias Ssmsg.MessageService

  action_fallback SsmsgWeb.FallbackController

  def add(conn, params) do
    with :ok <- MessageService.add(params) do
      json(conn, %{status: "OK"})
    end
  end

  def get(conn, %{"email" => email} = _params) do
    with {:ok, list} <- MessageService.get(email) do
      json(conn, list)
    end
  end
end
