defmodule BlogGraphqlApi.Blog do
  import Ecto.Query, warn: false

  alias BlogGraphqlApi.Repo
  alias BlogGraphqlApi.Blog.Post

  def list_post(limit, offset), do: Post |> limit(^limit) |> offset(^offset) |> Repo.all()
  def list_post, do: Post |> Repo.all()

  def list_post_by_id(id) do
    Post
    |> where([a], a.author_id == ^id)
    |> Repo.all()
  end

  def get_post!(id), do: Repo.get!(Post, id)

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post), do: Repo.delete(post)

  def change_post(%Post{} = post), do: Post.changeset(post, %{})
end
