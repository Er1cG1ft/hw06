defmodule Hw06.TasksTest do
  use Hw06.DataCase

  alias Hw06.Tasks

  describe "tasks" do
    alias Hw06.Tasks.Task

    @valid_attrs %{completed: true, description: "some description", title: "some title"}
    @update_attrs %{completed: false, description: "some updated description", title: "some updated title"}
    @invalid_attrs %{completed: nil, description: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tasks.create_task(@valid_attrs)
      assert task.completed == true
      assert task.description == "some description"
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Tasks.update_task(task, @update_attrs)
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end

  describe "task_times" do
    alias Hw06.Tasks.TaskTime

    @valid_attrs %{time: 42}
    @update_attrs %{time: 43}
    @invalid_attrs %{time: nil}

    def task_time_fixture(attrs \\ %{}) do
      {:ok, task_time} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_task_time()

      task_time
    end

    test "list_task_times/0 returns all task_times" do
      task_time = task_time_fixture()
      assert Tasks.list_task_times() == [task_time]
    end

    test "get_task_time!/1 returns the task_time with given id" do
      task_time = task_time_fixture()
      assert Tasks.get_task_time!(task_time.id) == task_time
    end

    test "create_task_time/1 with valid data creates a task_time" do
      assert {:ok, %TaskTime{} = task_time} = Tasks.create_task_time(@valid_attrs)
      assert task_time.time == 42
    end

    test "create_task_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task_time(@invalid_attrs)
    end

    test "update_task_time/2 with valid data updates the task_time" do
      task_time = task_time_fixture()
      assert {:ok, %TaskTime{} = task_time} = Tasks.update_task_time(task_time, @update_attrs)
      assert task_time.time == 43
    end

    test "update_task_time/2 with invalid data returns error changeset" do
      task_time = task_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task_time(task_time, @invalid_attrs)
      assert task_time == Tasks.get_task_time!(task_time.id)
    end

    test "delete_task_time/1 deletes the task_time" do
      task_time = task_time_fixture()
      assert {:ok, %TaskTime{}} = Tasks.delete_task_time(task_time)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task_time!(task_time.id) end
    end

    test "change_task_time/1 returns a task_time changeset" do
      task_time = task_time_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task_time(task_time)
    end
  end
end
