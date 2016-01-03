defmodule DrunkenAngular.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :hash, :string
      add :recovery_hash, :string
      add :timestamps, :string

      timestamps
    end
    create unique_index(:users, [:username])
    create unique_index(:users, [:email])

  end
end
