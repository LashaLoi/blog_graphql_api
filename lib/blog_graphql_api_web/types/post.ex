defmodule BlogGraphqlApiWeb.Types.Post do
  use Absinthe.Schema.Notation

  alias BlogGraphqlApiWeb.Resolvers.{Author, Comment}

  object :post do
    field :id, :id |> non_null
    field :author, :string |> non_null
    field :description, :string |> non_null
    field :title, :string |> non_null
    field :likes, :integer

    field :authors, :author |> list_of do
      arg(:limit, :integer)
      arg(:offset, :integer)

      resolve(&Author.authors/3)
    end

    field :comments, :comment |> list_of do
      resolve(&Comment.list_comment_by_id/3)
    end
  end
end
