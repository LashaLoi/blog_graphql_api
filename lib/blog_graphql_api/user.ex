defmodule BlogGraphqlApi.User do
  import Ecto.Query, warn: false

  alias BlogGraphqlApi.Repo
  alias BlogGraphqlApi.User.Author

  def list_author(%{limit: limit, offset: offset}) do
    Author |> limit(^limit) |> offset(^offset) |> Repo.all()
  end

  def list_author(_parent), do: Repo.all(Author)

  def authorize(id), do: Repo.get!(Author, id)

  def register(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  def delete_author(%Author{} = author), do: Repo.delete(author)

  def change_author(%Author{} = author) do
    Author.changeset(author, %{})
  end
end
