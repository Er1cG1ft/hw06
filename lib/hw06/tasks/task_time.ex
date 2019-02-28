defmodule Hw06.Tasks.TaskTime do
  use Ecto.Schema
  import Ecto.Changeset


  schema "task_times" do
    field :time, :integer
    field :user_id, :id
    field :task_id, :id

    timestamps()
  end

  @doc false
  def changeset(task_time, attrs) do
    task_time
    |> cast(attrs, [:time, :user_id, :task_id])
    |> validate_required([:time, :user_id, :task_id])
  end
end
