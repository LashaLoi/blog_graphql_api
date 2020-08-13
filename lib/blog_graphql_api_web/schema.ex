defmodule BlogGraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias BlogGraphqlApiWeb.Queries.{Author, Post, Comment}

  import_types(Author)
  import_types(Post)
  import_types(Comment)

  query do
    import_fields(:post_queries)
    import_fields(:author_queries)
    import_fields(:comment_queries)
  end

  mutation do
    import_fields(:post_mutations)
    import_fields(:author_mutations)
    import_fields(:comment_mutations)
  end
end
