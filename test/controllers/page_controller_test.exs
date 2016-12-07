defmodule Meetsense.PageControllerTest do
  use Meetsense.ConnCase

  test "shows an empty page if uninitialized", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "There are not gatherings yet"
  end

  test "shows a gathering, the associated users and the votables", %{conn: conn} do
    gathering = Repo.insert! %Meetsense.Gathering{name: "Fishing"}
    user = Repo.insert! %Meetsense.User{name: "Peter"}
    Repo.insert! %Meetsense.UserGathering{user: user, gathering: gathering}
    votable = Repo.insert! %Meetsense.Votable{name: "November 1st", gathering: gathering}

    conn = get conn, "/"
    assert html_response(conn, 200) =~ gathering.name
    assert html_response(conn, 200) =~ user.name
    assert html_response(conn, 200) =~ votable.name
  end
end
