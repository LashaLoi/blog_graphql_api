defmodule BlogGraphqlApi.Comment.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :post_id, :id
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:text, :post_id])
    |> validate_required([:text, :post_id])
  end
end
