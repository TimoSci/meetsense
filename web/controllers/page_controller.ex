require IEx

defmodule Meetsense.PageController do
  use Meetsense.Web, :controller

  alias Meetsense.Vote
  alias Meetsense.Gathering

  def index(conn, params) do
    case first_gathering do
      nil ->
        render conn, "empty.html"
      _ ->
        vote_changeset = Vote.changeset(%Vote{})
        # gathering = gathering_with_associations(first_gathering)
        gathering = gathering_with_associations(gathering(params["gathering_id"]))
        render conn, "index.html", gathering: gathering, users: gathering.users, votables: gathering.votables
    end
  end

  defp first_gathering do
    Meetsense.Gathering |> Ecto.Query.first |> Repo.one
  end

  defp gathering(id) do
    # Meetsense.Gathering |> Ecto.Query.where(id: 1) |> Meetsense.Repo.one
    Repo.get!(Gathering, id)
  end

  defp gathering_with_associations(gathering) do
    gathering |> Repo.preload([:users, :votables])
  end
end
