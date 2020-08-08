defmodule BlogGraphqlApi.User do
  import Ecto.Query, warn: false
  alias BlogGraphqlApi.Repo

  alias BlogGraphqlApi.User.Author

  def list_author do
    Repo.all(Author)
  end

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

  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  def change_author(%Author{} = author) do
    Author.changeset(author, %{})
  end
end
