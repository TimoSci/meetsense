defmodule Meetsense.PageController do
  use Meetsense.Web, :controller

  def index(conn, _params) do
    case first_gathering do
      nil ->
        render conn, "index.html", gathering: %Meetsense.Gathering {name: 'None'}, users: [], votables: []
      _ ->
        gathering = gathering_with_associations(first_gathering)
        render conn, "index.html", gathering: gathering, users: gathering.users, votables: gathering.votables
    end
  end

  defp first_gathering do
    Meetsense.Gathering |> Ecto.Query.first |> Repo.one
  end

  defp gathering_with_associations(gathering) do
    gathering |> Repo.preload([:users, :votables])
  end
end
