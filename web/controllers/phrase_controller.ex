defmodule DrunkenAngular.PhraseController do
  use DrunkenAngular.Web, :controller

  alias DrunkenAngular.Phrase

  plug :scrub_params, "phrase" when action in [:create, :update]

  def index(conn, _params) do
    phrases = Repo.all(Phrase)
    render(conn, "index.json", phrases: phrases)
  end

  def create(conn, %{"phrase" => phrase_params}) do
    changeset = Phrase.changeset(%Phrase{}, phrase_params)

    case Repo.insert(changeset) do
      {:ok, phrase} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", phrase_path(conn, :show, phrase))
        |> render("show.json", phrase: phrase)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DrunkenAngular.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    phrase = Repo.get!(Phrase, id)
    render(conn, "show.json", phrase: phrase)
  end

  def update(conn, %{"id" => id, "phrase" => phrase_params}) do
    phrase = Repo.get!(Phrase, id)
    changeset = Phrase.changeset(phrase, phrase_params)

    case Repo.update(changeset) do
      {:ok, phrase} ->
        render(conn, "show.json", phrase: phrase)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DrunkenAngular.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    phrase = Repo.get!(Phrase, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(phrase)

    send_resp(conn, :no_content, "")
  end
end
