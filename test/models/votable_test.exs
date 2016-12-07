defmodule Meetsense.VotableTest do
  use Meetsense.ModelCase

  alias Meetsense.Votable

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Votable.changeset(%Votable{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Votable.changeset(%Votable{}, @invalid_attrs)
    refute changeset.valid?
  end
end
