defmodule CheckboxProblem.Repo.Migrations.CreateCheckboxes do
  use Ecto.Migration

  def change do
    create table(:checkboxes) do
      add :not_blank, :string
      add :example_checkbox, :boolean, default: false, null: false

      timestamps()
    end

  end
end
