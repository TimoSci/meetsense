defmodule Meetsense.UserGathering do
  use Meetsense.Web, :model

  schema "user_gatherings" do
    belongs_to :user, Meetsense.User
    belongs_to :gathering, Meetsense.Gathering

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
