defmodule BlogGraphqlApi.Repo.Migrations.AddAuthorIdToPost do
  use Ecto.Migration

  def change do
    alter table("post") do
      add :author_id, :id
    end
  end
end
