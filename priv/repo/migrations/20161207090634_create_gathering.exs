defmodule Meetsense.Repo.Migrations.CreateGathering do
  use Ecto.Migration

  def change do
    create table(:gatherings) do
      add :name, :string

      timestamps()
    end

  end
end
