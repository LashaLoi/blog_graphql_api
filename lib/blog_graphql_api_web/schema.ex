defmodule BlogGraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias BlogGraphqlApiWeb.Queries.{Author, Post}

  import_types(Author)
  import_types(Post)

  query do
    import_fields(:post_queries)
    import_fields(:author_queries)
  end

  mutation do
    import_fields(:post_mutations)
    import_fields(:author_mutations)
  end
end
