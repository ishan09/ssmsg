defmodule Ssmsg.Message do

use Ecto.Schema
import Ecto.Changeset
alias  Ssmsg.Message

@required_fields [:to, :message]

schema "message" do
  field(:to, :string)
  field(:message, :string)
end


def changeset(params) do
  %Message{}
  |> cast(params, @required_fields)
  |> validate_required(@required_fields)
  |> validate_change(:to, &validate_email/2)

end

def validate_email(:to, email) do
  email_regex = ~r/[a-zA-Z0-9_+.-]+@[a-zA-Z0-0_.:\[\]-]+/
  if  !Regex.match?(email_regex, email) do
    [to: "invalid email"]
  else
    []
  end

end
end
