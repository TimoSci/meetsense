
defmodule Meetsense.VoteTest do
  use Meetsense.ModelCase

  alias Meetsense.Vote

  @valid_attrs %{value: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vote.changeset(%Vote{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vote.changeset(%Vote{}, @invalid_attrs)
    refute changeset.valid?
  end
end
