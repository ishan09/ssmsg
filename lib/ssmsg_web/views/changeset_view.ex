defmodule SsmsgWeb.ChangesetView do
  use SsmsgWeb, :view

  def render("error.json", %{changeset: changeset}) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
