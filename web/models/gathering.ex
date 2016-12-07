defmodule Meetsense.Gathering do
  use Meetsense.Web, :model

  schema "gatherings" do
    field :name, :string
    has_many :user_gatherings, Meetsense.UserGathering
    has_many :votables, Meetsense.Votables

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
