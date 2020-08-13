defmodule BlogGraphqlApi.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :text, :string
      add :post_id, :integer

      timestamps()
    end

  end
end
