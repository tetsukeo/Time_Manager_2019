defmodule AppWeb.WorkingtimeControllerTest do
  use AppWeb.ConnCase

  alias App.Result
  alias App.Result.Workingtime

  @create_attrs %{
    end: ~D[2010-04-17],
    start: ~D[2010-04-17]
  }
  @update_attrs %{
    end: ~D[2011-05-18],
    start: ~D[2011-05-18]
  }
  @invalid_attrs %{end: nil, start: nil}

  def fixture(:workingtime) do
    {:ok, workingtime} = Result.create_workingtime(@create_attrs)
    workingtime
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all workingtimes", %{conn: conn} do
      conn = get(conn, Routes.workingtime_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create workingtime" do
    test "renders workingtime when data is valid", %{conn: conn} do
      conn = post(conn, Routes.workingtime_path(conn, :create), workingtime: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.workingtime_path(conn, :show, id))

      assert %{
               "id" => id,
               "end" => "2010-04-17",
               "start" => "2010-04-17"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.workingtime_path(conn, :create), workingtime: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update workingtime" do
    setup [:create_workingtime]

    test "renders workingtime when data is valid", %{conn: conn, workingtime: %Workingtime{id: id} = workingtime} do
      conn = put(conn, Routes.workingtime_path(conn, :update, workingtime), workingtime: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.workingtime_path(conn, :show, id))

      assert %{
               "id" => id,
               "end" => "2011-05-18",
               "start" => "2011-05-18"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, workingtime: workingtime} do
      conn = put(conn, Routes.workingtime_path(conn, :update, workingtime), workingtime: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete workingtime" do
    setup [:create_workingtime]

    test "deletes chosen workingtime", %{conn: conn, workingtime: workingtime} do
      conn = delete(conn, Routes.workingtime_path(conn, :delete, workingtime))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.workingtime_path(conn, :show, workingtime))
      end
    end
  end

  defp create_workingtime(_) do
    workingtime = fixture(:workingtime)
    {:ok, workingtime: workingtime}
  end
end
