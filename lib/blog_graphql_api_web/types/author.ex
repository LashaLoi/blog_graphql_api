defmodule BlogGraphqlApiWeb.Types.Author do
  use Absinthe.Schema.Notation

  alias BlogGraphqlApiWeb.Resolvers.Post

  object :author do
    field :id, :id |> non_null
    field :first_name, :string |> non_null
    field :last_name, :string |> non_null
    field :age, :integer |> non_null

    field :posts, :post |> list_of do
      arg(:limit, :integer)
      arg(:offset, :integer)

      resolve(&Post.list_post_by_id/3)
    end
  end
end
