defmodule Meetsense.User do
  use Meetsense.Web, :model

  schema "users" do
    field :name, :string
    has_many :votes, Meetsense.Vote
    has_many :user_gatherings, Meetsense.UserGathering
    many_to_many :gatherings, Meetsense.Gathering, join_through: "user_gatherings"

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
