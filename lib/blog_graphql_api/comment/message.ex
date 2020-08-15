defmodule BlogGraphqlApi.Comment.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :post_id, :id
    field :text, :string

    timestamps()
  end

  @required_fields [:text, :post_id]

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
