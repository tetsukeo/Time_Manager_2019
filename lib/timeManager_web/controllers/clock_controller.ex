defmodule AppWeb.ClockController do
  use AppWeb, :controller

  alias App.Result
  alias App.Result.Clock

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    clocks = Result.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Result.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"id" => id}) do
    clock = Result.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Result.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Result.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Result.get_clock!(id)

    with {:ok, %Clock{}} <- Result.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
