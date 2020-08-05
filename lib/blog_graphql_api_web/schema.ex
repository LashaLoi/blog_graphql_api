defmodule BlogGraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias BlogGraphqlApiWeb.BlogResolver

  import_types(BlogGraphqlApiWeb.DataTypes)

  query do
    @desc "Get all posts"
    field :get_posts, :post |> non_null |> list_of do
      arg(:limit, :integer)
      arg(:offset, :integer)

      resolve(&BlogResolver.list_post/3)
    end

    @desc "Get post by id"
    field :get_post, :post do
      arg(:id, :id |> non_null)

      resolve(&BlogResolver.get_post/3)
    end
  end

  mutation do
    @desc "Create a new post"
    field :create_post, :post do
      arg(:post, :post_input)

      resolve(&BlogResolver.create_post/3)
    end

    @desc "Update post"
    field :update_post, :post do
      arg(:id, :id |> non_null)
      arg(:post, :update_post_input)

      resolve(&BlogResolver.update_post/3)
    end

    @desc "Delete post by id"
    field :delete_post, :boolean do
      arg(:id, :id |> non_null)

      resolve(&BlogResolver.delete_post/3)
    end
  end
end
