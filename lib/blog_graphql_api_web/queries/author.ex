defmodule BlogGraphqlApiWeb.Queries.Author do
  use Absinthe.Schema.Notation

  alias BlogGraphqlApiWeb.Resolvers.Author

  import_types(BlogGraphqlApiWeb.Types.Author)
  import_types(BlogGraphqlApiWeb.Inputs.Author)

  object :author_queries do
    @desc "Get author by id"
    field :get_author, :author do
      arg(:id, :id |> non_null)

      resolve(&Author.get_author/3)
    end

    @desc "Get list of authors"
    field :get_authors, :author |> list_of do
      resolve(&Author.authors/3)
    end
  end

  object :author_mutations do
    @desc "Register author"
    field :register, :author do
      arg(:author, :create_author_input)

      resolve(&Author.register/3)
    end
  end
end
