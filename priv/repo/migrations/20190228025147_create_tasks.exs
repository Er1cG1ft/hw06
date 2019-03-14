defmodule Hw06.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :string
      add :completed, :boolean, default: false, null: false
      add :assigned_user, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:tasks, [:assigned_user])
  end
end
