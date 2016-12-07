defmodule Meetsense.VotableControllerTest do
  use Meetsense.ConnCase

  alias Meetsense.Votable
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, votable_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing votables"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, votable_path(conn, :new)
    assert html_response(conn, 200) =~ "New votable"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, votable_path(conn, :create), votable: @valid_attrs
    assert redirected_to(conn) == votable_path(conn, :index)
    assert Repo.get_by(Votable, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, votable_path(conn, :create), votable: @invalid_attrs
    assert html_response(conn, 200) =~ "New votable"
  end

  test "shows chosen resource", %{conn: conn} do
    votable = Repo.insert! %Votable{}
    conn = get conn, votable_path(conn, :show, votable)
    assert html_response(conn, 200) =~ "Show votable"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, votable_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    votable = Repo.insert! %Votable{}
    conn = get conn, votable_path(conn, :edit, votable)
    assert html_response(conn, 200) =~ "Edit votable"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    votable = Repo.insert! %Votable{}
    conn = put conn, votable_path(conn, :update, votable), votable: @valid_attrs
    assert redirected_to(conn) == votable_path(conn, :show, votable)
    assert Repo.get_by(Votable, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    votable = Repo.insert! %Votable{}
    conn = put conn, votable_path(conn, :update, votable), votable: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit votable"
  end

  test "deletes chosen resource", %{conn: conn} do
    votable = Repo.insert! %Votable{}
    conn = delete conn, votable_path(conn, :delete, votable)
    assert redirected_to(conn) == votable_path(conn, :index)
    refute Repo.get(Votable, votable.id)
  end
end
