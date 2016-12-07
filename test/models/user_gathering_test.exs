defmodule Meetsense.UserGatheringTest do
  use Meetsense.ModelCase

  alias Meetsense.UserGathering

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserGathering.changeset(%UserGathering{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserGathering.changeset(%UserGathering{}, @invalid_attrs)
    refute changeset.valid?
  end
end
