defmodule Meetsense.Repo.Migrations.CreateUserGathering do
  use Ecto.Migration

  def change do
    create table(:user_gatherings) do
      add :user_id, references(:users, on_delete: :nothing)
      add :gathering_id, references(:gatherings, on_delete: :nothing)

      timestamps()
    end
    create index(:user_gatherings, [:user_id])
    create index(:user_gatherings, [:gathering_id])

  end
end
