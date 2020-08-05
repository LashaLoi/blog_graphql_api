defmodule BlogGraphqlApi.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post" do
    field :author, :string
    field :description, :string
    field :likes, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :author, :likes])
    |> validate_required([:title, :description, :author, :likes])
  end
end
