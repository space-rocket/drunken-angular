defmodule DrunkenAngular.ArtistControllerTest do
  use DrunkenAngular.ConnCase

  alias DrunkenAngular.Artist
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, artist_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = get conn, artist_path(conn, :show, artist)
    assert json_response(conn, 200)["data"] == %{"id" => artist.id,
      "name" => artist.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, artist_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, artist_path(conn, :create), artist: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Artist, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, artist_path(conn, :create), artist: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = put conn, artist_path(conn, :update, artist), artist: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Artist, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = put conn, artist_path(conn, :update, artist), artist: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = delete conn, artist_path(conn, :delete, artist)
    assert response(conn, 204)
    refute Repo.get(Artist, artist.id)
  end
end
