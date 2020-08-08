defmodule BlogGraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias BlogGraphqlApiWeb.{BlogResolver, AuthorResolver}

  import_types(BlogGraphqlApiWeb.DataTypes)

  object :post do
    field :id, :id
    field :author, :string
    field :description, :string
    field :title, :string
    field :likes, :integer

    field :get_author, :author do
      resolve(&AuthorResolver.get_author/3)
    end
  end

  object :author do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :age, :integer

    field :posts, :post |> list_of do
      resolve(&BlogResolver.list_post_by_id/3)
    end
  end

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

    @desc "Get list of authors"
    field :get_authors, :author |> list_of do
      resolve(&AuthorResolver.list_author/3)
    end

    @desc "Get author by id"
    field :get_author, :author do
      arg(:id, :id |> non_null)

      resolve(&AuthorResolver.get_author/3)
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

    @desc "Register author"
    field :register, :author do
      arg(:first_name, :string |> non_null)
      arg(:last_name, :string |> non_null)
      arg(:age, :integer |> non_null)

      resolve(&AuthorResolver.register/3)
    end
  end
end
