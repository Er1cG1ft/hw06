defmodule Hw06Web.TaskTimeController do
  use Hw06Web, :controller

  alias Hw06.Tasks
  alias Hw06.Tasks.TaskTime
  alias Hw06.Users

  def index(conn, _params) do
    task_times = Tasks.list_task_times()
    render(conn, "index.html", task_times: task_times)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task_time(%TaskTime{})
    render(conn, "new.html", changeset: changeset, users: Users.get_for_select)
  end

  def create(conn, %{"task_time" => task_time_params}) do
    case Tasks.create_task_time(task_time_params) do
      {:ok, task_time} ->
        conn
        |> put_flash(:info, "Task time created successfully.")
        |> redirect(to: Routes.task_time_path(conn, :show, task_time))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task_time = Tasks.get_task_time!(id)
    email = Users.get_user!(task_time.user_id).email
    render(conn, "show.html", task_time: task_time, email: email)
  end

  def edit(conn, %{"id" => id}) do
    task_time = Tasks.get_task_time!(id)
    changeset = Tasks.change_task_time(task_time)
    render(conn, "edit.html", task_time: task_time, changeset: changeset, users: Users.get_for_select)
  end

  def update(conn, %{"id" => id, "task_time" => task_time_params}) do
    task_time = Tasks.get_task_time!(id)
    IO.inspect task_time_params
    case Tasks.update_task_time(task_time, task_time_params) do
      {:ok, task_time} ->
        conn
        |> put_flash(:info, "Task time updated successfully.")
        |> redirect(to: Routes.task_time_path(conn, :show, task_time))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task_time: task_time, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_time = Tasks.get_task_time!(id)
    {:ok, _task_time} = Tasks.delete_task_time(task_time)

    conn
    |> put_flash(:info, "Task time deleted successfully.")
    |> redirect(to: Routes.task_time_path(conn, :index))
  end
end
