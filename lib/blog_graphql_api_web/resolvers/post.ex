defmodule BlogGraphqlApiWeb.Resolvers.Post do
  alias BlogGraphqlApi.Blog

  def list_post(_parent, %{limit: limit, offset: offset}, _info),
    do: {:ok, Blog.list_post(limit, offset)}

  def list_post(_parent, _params, _info), do: {:ok, Blog.list_post()}

  def list_post_by_id(%{id: id}, _params, _info) do
    {:ok, Blog.list_post_by_id(id)}
  end

  def get_post(_parent, %{id: id}, _info), do: {:ok, Blog.get_post!(id)}

  def create_post(_parent, %{post: post}, _info) do
    case Blog.create_post(post) do
      {:ok, post} ->
        {:ok, post}

      _error ->
        {:error, "Could not create post"}
    end
  end

  def update_post(_parent, %{id: id, post: post}, _info) do
    case Blog.update_post(Blog.get_post!(id), post) do
      {:ok, post} ->
        {:ok, post}

      _error ->
        {:error, "Cannot update post with id=#{id}"}
    end
  end

  def delete_post(_parent, %{id: id}, _info) do
    with post <- Blog.get_post!(id), {:ok, _} <- Blog.delete_post(post) do
      {:ok, true}
    else
      _ -> {:error, false}
    end
  end
end
