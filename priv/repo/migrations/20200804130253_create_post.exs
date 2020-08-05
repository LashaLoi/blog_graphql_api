defmodule BlogGraphqlApi.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :title, :string
      add :description, :string
      add :author, :string
      add :likes, :integer

      timestamps()
    end

  end
end
