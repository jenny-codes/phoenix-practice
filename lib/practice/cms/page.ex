defmodule Practice.CMS.Page do
  use Ecto.Schema
  import Ecto.Changeset

  alias Practice.CMS.Author

  schema "pages" do
    field :views, :integer
    field :body, :string
    field :title, :string
    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
