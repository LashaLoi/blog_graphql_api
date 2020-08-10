defmodule BlogGraphqlApiWeb.Queries.Post do
  use Absinthe.Schema.Notation

  alias BlogGraphqlApiWeb.Resolvers.Post

  import_types(BlogGraphqlApiWeb.Types.Post)
  import_types(BlogGraphqlApiWeb.Inputs.Post)

  object :post_queries do
    @desc "Get all posts"
    field :get_posts, :post |> non_null |> list_of do
      arg(:limit, :integer)
      arg(:offset, :integer)

      resolve(&Post.list_post/3)
    end

    @desc "Get post by id"
    field :get_post, :post do
      arg(:id, :id |> non_null)

      resolve(&Post.get_post/3)
    end
  end

  object :post_mutations do
    @desc "Create a new post"
    field :create_post, :post do
      arg(:post, :create_post_input)

      resolve(&Post.create_post/3)
    end

    @desc "Update post"
    field :update_post, :post do
      arg(:id, :id |> non_null)
      arg(:post, :update_post_input)

      resolve(&Post.update_post/3)
    end

    @desc "Delete post by id"
    field :delete_post, :boolean do
      arg(:id, :id |> non_null)

      resolve(&Post.delete_post/3)
    end
  end
end
