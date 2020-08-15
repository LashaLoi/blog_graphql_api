defmodule BlogGraphqlApiWeb.Resolvers.Author do
  alias BlogGraphqlApi.User

  def register(_parent, params, _ctx) do
    case User.register(params) do
      {:ok, author} ->
        {:ok, author}

      _error ->
        {:error, "Could not create a author"}
    end
  end

  def authors(_parent, params, _ctx), do: {:ok, User.list_author(params)}

  def get_author(_parent, %{id: id}, %{context: %{current_user: current_user}}) do
    current_user |> IO.inspect()

    {:ok, User.authorize(id)}
  end

  def get_author(%{author_id: author_id}, _params, _ctx) do
    {:ok, User.authorize(author_id)}
  end
end
