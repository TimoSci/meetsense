defmodule Meetsense.Repo.Migrations.CreateVote do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :user_id, references(:users, on_delete: :nothing)
      add :votable_id, references(:votables, on_delete: :nothing)

      timestamps()
    end
    create index(:votes, [:user_id])
    create index(:votes, [:votable_id])

  end
end
