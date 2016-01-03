defmodule DrunkenAngular.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string

      timestamps
    end

  end
end
