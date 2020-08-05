defmodule BlogGraphqlApiWeb.Router do
  use BlogGraphqlApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BlogGraphqlApiWeb do
    pipe_through :api
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug.GraphiQL,
      schema: BlogGraphqlApiWeb.Schema,
      interface: :playground,
      context: %{pubsub: BlogGraphqlApiWeb.Endpoint}
  end
end
