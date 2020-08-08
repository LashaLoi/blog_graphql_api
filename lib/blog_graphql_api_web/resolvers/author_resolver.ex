defmodule BlogGraphqlApiWeb.AuthorResolver do
  alias BlogGraphqlApi.User

  def register(_parent, params, _info) do
    case User.register(params) do
      {:ok, author} ->
        {:ok, author}

      _error ->
        {:error, "Could not create a author"}
    end
  end

  def list_author(_parent, _params, _info) do
    {:ok, User.list_author()}
  end

  def get_author(_parent, %{id: id}, _info), do: {:ok, User.authorize(id)}
  def get_author(%{author_id: author_id}, _params, _info), do: {:ok, User.authorize(author_id)}
end
