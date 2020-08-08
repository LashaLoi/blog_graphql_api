defmodule BlogGraphqlApi.User.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "author" do
    field :age, :integer
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @required_fields [:first_name, :last_name, :age]

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
