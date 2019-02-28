defmodule Hw06.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias Hw06.Repo

  alias Hw06.Tasks.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end

  alias Hw06.Tasks.TaskTime

  @doc """
  Returns the list of task_times.

  ## Examples

      iex> list_task_times()
      [%TaskTime{}, ...]

  """
  def list_task_times do
    Repo.all(TaskTime)
  end

  @doc """
  Gets a single task_time.

  Raises `Ecto.NoResultsError` if the Task time does not exist.

  ## Examples

      iex> get_task_time!(123)
      %TaskTime{}

      iex> get_task_time!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_time!(id), do: Repo.get!(TaskTime, id)

  @doc """
  Creates a task_time.

  ## Examples

      iex> create_task_time(%{field: value})
      {:ok, %TaskTime{}}

      iex> create_task_time(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_time(attrs \\ %{}) do
    %TaskTime{}
    |> TaskTime.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_time.

  ## Examples

      iex> update_task_time(task_time, %{field: new_value})
      {:ok, %TaskTime{}}

      iex> update_task_time(task_time, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_time(%TaskTime{} = task_time, attrs) do
    task_time
    |> TaskTime.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TaskTime.

  ## Examples

      iex> delete_task_time(task_time)
      {:ok, %TaskTime{}}

      iex> delete_task_time(task_time)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_time(%TaskTime{} = task_time) do
    Repo.delete(task_time)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_time changes.

  ## Examples

      iex> change_task_time(task_time)
      %Ecto.Changeset{source: %TaskTime{}}

  """
  def change_task_time(%TaskTime{} = task_time) do
    TaskTime.changeset(task_time, %{})
  end
  
  def get_task_times_for_task(id) do
    Repo.all from t in TaskTime, where: t.task_id == ^id
  end
end
