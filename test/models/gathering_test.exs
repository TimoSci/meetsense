defmodule Meetsense.GatheringTest do
  use Meetsense.ModelCase

  alias Meetsense.Gathering

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Gathering.changeset(%Gathering{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Gathering.changeset(%Gathering{}, @invalid_attrs)
    refute changeset.valid?
  end
end
