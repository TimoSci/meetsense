defmodule Meetsense.Votable do
  use Meetsense.Web, :model

  schema "votables" do
    field :name, :string
    field :description, :string
    belongs_to :gathering, Meetsense.Gathering
    has_many :votes, Meetsense.Vote

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
end
