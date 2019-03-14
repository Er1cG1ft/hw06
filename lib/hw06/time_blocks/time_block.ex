defmodule Hw06.TimeBlocks.TimeBlock do
  use Ecto.Schema
  import Ecto.Changeset


  schema "time_blocks" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    field :user_id, :id
    field :task_id, :id

    timestamps()
  end

  @doc false
  def changeset(time_block, attrs) do
    time_block
    |> cast(attrs, [:user_id, :task_id, :start, :end])
    |> validate_required([:user_id, :task_id, :start])
  end
end
