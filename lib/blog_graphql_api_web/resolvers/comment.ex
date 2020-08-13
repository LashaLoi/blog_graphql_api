defmodule BlogGraphqlApiWeb.Resolvers.Comment do
  alias BlogGraphqlApi.Comment

  def list_comment(_parent, _params, _info), do: {:ok, Comment.list_message()}

  def list_comment_by_id(%{id: post_id}, _parent, _info) do
    comments = Comment.list_message() |> Enum.filter(fn %{post_id: id} -> id === post_id end)

    {:ok, comments}
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
