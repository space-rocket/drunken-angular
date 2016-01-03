defmodule DrunkenAngular.ArtistTest do
  use DrunkenAngular.ModelCase

  alias DrunkenAngular.Artist

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artist.changeset(%Artist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artist.changeset(%Artist{}, @invalid_attrs)
    refute changeset.valid?
  end
end
