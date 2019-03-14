defmodule Hw06Web.TaskController do
  use Hw06Web, :controller

  alias Hw06.Tasks
  alias Hw06.Tasks.Task
  alias Hw06.Users
  
  plug :authenticate_user

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    render(conn, "new.html", changeset: changeset, users: Users.get_for_select_managed(conn.assigns.current_user.id))
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset, users: Users.get_for_select_managed(conn.assigns.current_user.id))
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
  
  def task_report(conn, _params) do
    underlings = Users.get_underlings(conn.assigns.current_user.id)
    tasks = Tasks.get_tasks_for_underlings(underlings)
    render(conn, "task_report.html", tasks: tasks)
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
