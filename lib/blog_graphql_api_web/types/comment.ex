defmodule BlogGraphqlApiWeb.Types.Comment do
  use Absinthe.Schema.Notation

  object :comment do
    field :id, :id |> non_null
    field :text, :string |> non_null
    field :post_id, :id |> non_null
  end
end
