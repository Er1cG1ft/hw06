defmodule Hw06Web.PageController do
  use Hw06Web, :controller
  alias Hw06.Tasks

  def index(conn, _params) do
    if conn.assigns.current_user != nil do
      assigned = Tasks.get_assigned_count(conn.assigns.current_user.id)
      completed = Tasks.get_completed_count
      open = Tasks.get_open_count
      render(conn, "index.html", assigned: assigned, completed: completed, open: open)
    else
      render(conn, "index.html")
    end
  end
end
