defmodule CheckboxProblem.Checkboxes.Checkbox do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checkboxes" do
    field :example_checkbox, :boolean, default: false
    field :not_blank, :date

    timestamps()
  end

  @doc false
  def changeset(checkbox, attrs) do
    checkbox
    |> cast(attrs, [:not_blank, :example_checkbox])
    |> validate_required([:not_blank])
  end
end
