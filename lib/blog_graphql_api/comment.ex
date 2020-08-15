defmodule BlogGraphqlApi.Comment do
  import Ecto.Query, warn: false
  alias BlogGraphqlApi.Repo

  alias BlogGraphqlApi.Comment.Message

  def list_message, do: Repo.all(Message)

  def list_message_by_id(id) do
    Message
    |> where([m], m.post_id == ^id)
    |> Repo.all()
  end

  def get_message!(id), do: Repo.get!(Message, id)

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  def delete_message(%Message{} = message), do: Repo.delete(message)

  def change_message(%Message{} = message), do: Message.changeset(message, %{})
end
