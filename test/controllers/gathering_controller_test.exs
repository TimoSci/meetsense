defmodule Meetsense.GatheringControllerTest do
  use Meetsense.ConnCase

  alias Meetsense.Gathering
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, gathering_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing gatherings"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, gathering_path(conn, :new)
    assert html_response(conn, 200) =~ "New gathering"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, gathering_path(conn, :create), gathering: @valid_attrs
    assert redirected_to(conn) == gathering_path(conn, :index)
    assert Repo.get_by(Gathering, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, gathering_path(conn, :create), gathering: @invalid_attrs
    assert html_response(conn, 200) =~ "New gathering"
  end

  test "shows chosen resource", %{conn: conn} do
    gathering = Repo.insert! %Gathering{}
    conn = get conn, gathering_path(conn, :show, gathering)
    assert html_response(conn, 200) =~ "Show gathering"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, gathering_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    gathering = Repo.insert! %Gathering{}
    conn = get conn, gathering_path(conn, :edit, gathering)
    assert html_response(conn, 200) =~ "Edit gathering"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    gathering = Repo.insert! %Gathering{}
    conn = put conn, gathering_path(conn, :update, gathering), gathering: @valid_attrs
    assert redirected_to(conn) == gathering_path(conn, :show, gathering)
    assert Repo.get_by(Gathering, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    gathering = Repo.insert! %Gathering{}
    conn = put conn, gathering_path(conn, :update, gathering), gathering: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit gathering"
  end

  test "deletes chosen resource", %{conn: conn} do
    gathering = Repo.insert! %Gathering{}
    conn = delete conn, gathering_path(conn, :delete, gathering)
    assert redirected_to(conn) == gathering_path(conn, :index)
    refute Repo.get(Gathering, gathering.id)
  end
end
