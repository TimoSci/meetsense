defmodule Meetsense.Repo.Migrations.AddValueToVote do
  use Ecto.Migration

  def change do
    alter table(:votes) do
      add :value, :integer
    end
  end

end
