defmodule Hw06Web.TaskTimeController do
  use Hw06Web, :controller

  alias Hw06.Tasks
  alias Hw06.Tasks.TaskTime
  alias Hw06.Users
  
  plug :authenticate_user

  def new(conn, _params) do
    changeset = Tasks.change_task_time(%TaskTime{})
    render(conn, "new.html", changeset: changeset, users: Users.get_for_select)
  end

  def create(conn, %{"task_time" => task_time_params}) do
    task_time_params = Map.put(task_time_params, "time", (String.to_integer(Map.get(task_time_params, "time")) * 60) + String.to_integer(Map.get(task_time_params, "minutes")))
    task_time_params = Map.put(task_time_params, "user_id", conn.assigns.current_user.id)
    case Tasks.create_task_time(task_time_params) do
      {:ok, task_time} ->
        conn
        |> put_flash(:info, "Work logged successfully.")
        |> redirect(to: Routes.task_path(conn, :show, Tasks.get_task!(String.to_integer(Map.get(task_time_params, "task_id")))))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_time = Tasks.get_task_time!(id)
    {:ok, _task_time} = Tasks.delete_task_time(task_time)

    conn
    |> put_flash(:info, "Task time deleted successfully.")
    |> redirect(to: Routes.task_time_path(conn, :index))
  end
  
  def authenticate_user(conn, _params) do
    if conn.assigns.current_user != nil do
      conn
    else
      conn
      |> put_flash(:error, "Please log in to view this page.")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
