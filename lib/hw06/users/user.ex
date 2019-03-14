defmodule Hw06.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :manager_id, :integer
    has_many :tasks, Hw06.Tasks.Task
    has_many :time_blocks, Hw06.TimeBlocks.TimeBlock
    
    timestamps()
  end
  
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :admin, :first_name, :last_name, :manager_id])
    |> validate_required([:email, :admin, :first_name, :last_name, :manager_id])
  end
  
end
