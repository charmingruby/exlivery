defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrdersAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrdersAgent.start_link(%{})

      :order
      |> build()
      |> OrdersAgent.save()

      :order
      |> build()
      |> OrdersAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "12345678912,japanese_food,1,60.55japanese_food,1,60.55,121.10\n" <>
          "12345678912,japanese_food,1,60.55japanese_food,1,60.55,121.10\n"

      assert response == expected_response
    end
  end
end
