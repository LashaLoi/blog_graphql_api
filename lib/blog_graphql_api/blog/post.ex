defmodule BlogGraphqlApi.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:title, :description, :author, :likes, :id]

  schema "post" do
    field :author, :string
    field :description, :string
    field :likes, :integer
    field :title, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
