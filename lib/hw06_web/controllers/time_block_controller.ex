defmodule Hw06Web.TimeBlockController do
  use Hw06Web, :controller

  alias Hw06.TimeBlocks
  alias Hw06.TimeBlocks.TimeBlock
  alias Hw06.Tasks

  action_fallback Hw06Web.FallbackController

  def index(conn, _params) do
    time_blocks = TimeBlocks.list_time_blocks()
    render(conn, "index.json", time_blocks: time_blocks)
  end

  def create(conn, %{"time_block" => time_block_params}) do
    time_block_params = Map.put(time_block_params, "start", NaiveDateTime.utc_now)
    with {:ok, %TimeBlock{} = time_block} <- TimeBlocks.create_time_block(time_block_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.time_block_path(conn, :show, time_block))
      #|> redirect(to: Routes.task_path(conn, :show, task))
      |> render("show.json", time_block: time_block)
    end
  end

  def show(conn, %{"id" => id}) do
    time_block = TimeBlocks.get_time_block!(id)
    render(conn, "show.json", time_block: time_block)
  end

  def update(conn, %{"id" => id, "time_block" => time_block_params}) do
    time_block_params = Map.put(time_block_params, "end", NaiveDateTime.utc_now)
    time_block = TimeBlocks.get_time_block!(id)

    with {:ok, %TimeBlock{} = time_block} <- TimeBlocks.update_time_block(time_block, time_block_params) do
      render(conn, "show.json", time_block: time_block)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_block = TimeBlocks.get_time_block!(id)
    task = Tasks.get_task!(time_block.task_id)

    with {:ok, %TimeBlock{}} <- TimeBlocks.delete_time_block(time_block) do
      redirect(conn, to: Routes.task_path(conn, :show, task))
    end
  end
end
