defmodule DrunkenAngular.PhraseTest do
  use DrunkenAngular.ModelCase

  alias DrunkenAngular.Phrase

  @valid_attrs %{phrase: "some content", points: 42, wasSpoken: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Phrase.changeset(%Phrase{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Phrase.changeset(%Phrase{}, @invalid_attrs)
    refute changeset.valid?
  end
end
