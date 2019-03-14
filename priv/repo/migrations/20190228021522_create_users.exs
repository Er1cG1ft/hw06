defmodule Hw06.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :admin, :boolean, default: false, null: false
      add :manager_id, references(:users, on_delete: :nothing)
      timestamps()
    end
    
    create index(:users, [:manager_id])
  end
end
