defmodule Hw06.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    belongs_to :user, Hw06.Users.User, references: :user_id, foreign_key: :manager_id
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
