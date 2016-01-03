defmodule DrunkenAngular.Phrase do
  use DrunkenAngular.Web, :model

  schema "phrases" do
    field :phrase, :string
    field :points, :integer
    field :wasSpoken, :boolean, default: false

    timestamps
  end

  @required_fields ~w(phrase points wasSpoken)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:phrase)
  end
end
