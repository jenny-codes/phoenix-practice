defmodule Practice.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Practice.Accounts.Credential
  alias Practice.CMS.Author

  schema "users" do
    field :name, :string
    field :username, :string
    has_one :credential, Credential
    has_one :author, Author

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end
end
