defmodule Practice.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  alias Practice.Accounts.User

  schema "credentials" do
    field :email, :string
    # Remove the below line (generated by default) to enable the association below
    # field :user_id, :id
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
