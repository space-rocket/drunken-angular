defmodule DrunkenAngular.Repo.Migrations.CreatePhrase do
  use Ecto.Migration

  def change do
    create table(:phrases) do
      add :phrase, :string
      add :points, :integer
      add :wasSpoken, :boolean, default: false

      timestamps
    end
    create unique_index(:phrases, [:phrase])

  end
end
