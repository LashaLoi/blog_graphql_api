defmodule BlogGraphqlApiWeb.Resolvers.Comment do
  alias BlogGraphqlApi.Comment

  def list_comment(_parent, _params, _info), do: {:ok, Comment.list_message()}

  def list_comment_by_id(%{id: id}, _parent, _info) do
    {:ok, Comment.list_message_by_id(id)}
  end

  def create_comment(_parent, params, _info) do
    case Comment.create_message(params) do
      {:ok, comment} ->
        {:ok, comment}

      _error ->
        {:error, "Could not create message"}
    end
  end
end
