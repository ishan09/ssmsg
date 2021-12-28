defmodule Ssmsg.MessageService do
  alias Ssmsg.{Message, InMemory}
  # """

  #   1. Add message of the form (to: ..., msg: ...)
  #   2. Retreive all message where to == xx

  # """
  def add(params) do
    changeset = Message.changeset(params)
    if changeset.valid? do
      InMemory.save_message(changeset.changes)
    else
      {:error, changeset}
    end
  end

  def get(to) do
    InMemory.get_message(to)
  end
end
