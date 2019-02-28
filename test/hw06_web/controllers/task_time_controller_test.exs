defmodule Hw06Web.TaskTimeControllerTest do
  use Hw06Web.ConnCase

  alias Hw06.Tasks

  @create_attrs %{time: 42}
  @update_attrs %{time: 43}
  @invalid_attrs %{time: nil}

  def fixture(:task_time) do
    {:ok, task_time} = Tasks.create_task_time(@create_attrs)
    task_time
  end

  describe "index" do
    test "lists all task_times", %{conn: conn} do
      conn = get(conn, Routes.task_time_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Task times"
    end
  end

  describe "new task_time" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.task_time_path(conn, :new))
      assert html_response(conn, 200) =~ "New Task time"
    end
  end

  describe "create task_time" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.task_time_path(conn, :create), task_time: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.task_time_path(conn, :show, id)

      conn = get(conn, Routes.task_time_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Task time"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.task_time_path(conn, :create), task_time: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Task time"
    end
  end

  describe "edit task_time" do
    setup [:create_task_time]

    test "renders form for editing chosen task_time", %{conn: conn, task_time: task_time} do
      conn = get(conn, Routes.task_time_path(conn, :edit, task_time))
      assert html_response(conn, 200) =~ "Edit Task time"
    end
  end

  describe "update task_time" do
    setup [:create_task_time]

    test "redirects when data is valid", %{conn: conn, task_time: task_time} do
      conn = put(conn, Routes.task_time_path(conn, :update, task_time), task_time: @update_attrs)
      assert redirected_to(conn) == Routes.task_time_path(conn, :show, task_time)

      conn = get(conn, Routes.task_time_path(conn, :show, task_time))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, task_time: task_time} do
      conn = put(conn, Routes.task_time_path(conn, :update, task_time), task_time: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Task time"
    end
  end

  describe "delete task_time" do
    setup [:create_task_time]

    test "deletes chosen task_time", %{conn: conn, task_time: task_time} do
      conn = delete(conn, Routes.task_time_path(conn, :delete, task_time))
      assert redirected_to(conn) == Routes.task_time_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.task_time_path(conn, :show, task_time))
      end
    end
  end

  defp create_task_time(_) do
    task_time = fixture(:task_time)
    {:ok, task_time: task_time}
  end
end
