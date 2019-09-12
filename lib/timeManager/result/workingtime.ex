defmodule App.Result.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :start, :utc_datetime, null: false
    field :end, :utc_datetime, null: false
    belongs_to :user, App.Result.User

    timestamps()
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:start, :end, :user_id])

    |> validate_required([:start, :end, :user_id])
  end
end
