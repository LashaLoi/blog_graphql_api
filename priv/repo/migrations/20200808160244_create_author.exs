defmodule BlogGraphqlApi.Repo.Migrations.CreateAuthor do
  use Ecto.Migration

  def change do
    create table(:author) do
      add :first_name, :string
      add :last_name, :string
      add :age, :integer

      timestamps()
    end

  end
end
