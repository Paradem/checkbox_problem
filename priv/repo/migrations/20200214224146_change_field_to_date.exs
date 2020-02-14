defmodule CheckboxProblem.Repo.Migrations.ChangeFieldToDate do
  use Ecto.Migration

  def change do
    alter table(:checkboxes) do
      remove(:not_blank)
      add(:not_blank, :date)
    end
  end
end
