defmodule Meetsense.Repo.Migrations.CreateVotable do
  use Ecto.Migration

  def change do
    create table(:votables) do
      add :name, :string
      add :description, :text
      add :gathering_id, references(:gatherings, on_delete: :nothing)

      timestamps()
    end
    create index(:votables, [:gathering_id])

  end
end
