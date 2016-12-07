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


  #TODO DRY below

  def total_score(id) do
    votes(id) |> Meetsense.Repo.all |> Enum.sum
  end

  def vote_count(id,value) do
    query = from v in "votables", where: v.id == ^id, join: vote in "votes", on: vote.votable_id == v.id, select: vote.value, where: vote.value == ^value
    Meetsense.Repo.all(query) |> Enum.count
  end

  def votes(id) do
    from v in "votables", where: v.id == ^id, join: vote in "votes", on: vote.votable_id == v.id, select: vote.value
  end

end
