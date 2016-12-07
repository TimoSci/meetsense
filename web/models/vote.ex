defmodule Meetsense.Vote do
  use Meetsense.Web, :model

  schema "votes" do
    field :value, :integer
    belongs_to :user, Meetsense.User
    belongs_to :votable, Meetsense.Votable

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:value])
    |> validate_required([:value])
  end
end
