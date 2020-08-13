defmodule BlogGraphqlApiWeb.Queries.Comment do
  use Absinthe.Schema.Notation

  alias BlogGraphqlApiWeb.Resolvers.Comment

  import_types(BlogGraphqlApiWeb.Types.Comment)

  object :comment_queries do
    @desc "Get all comments"
    field :get_comments, :comment |> list_of do
      resolve(&Comment.list_comment/3)
    end
  end

  object :comment_mutations do
    @desc "Create a new comment"
    field :create_comment, :comment do
      arg(:text, :string |> non_null)
      arg(:post_id, :id |> non_null)

      resolve(&Comment.create_comment/3)
    end
  end
end
