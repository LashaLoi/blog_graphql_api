defmodule BlogGraphqlApi.Repo do
  use Ecto.Repo,
    otp_app: :blog_graphql_api,
    adapter: Ecto.Adapters.Postgres
end
