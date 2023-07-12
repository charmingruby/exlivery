defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrdersAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the order" do
      OrdersAgent.start_link(%{})

      order = build(:order)

      assert {:ok, _uuid} = OrdersAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrdersAgent.start_link(%{})

      :ok
    end

    test "when the order is found, return the order" do
      order = build(:order)

      {:ok, uuid} = OrdersAgent.save(order)

      response = OrdersAgent.get(uuid)

      expected_response =
        {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = OrdersAgent.get("0000000")

      expected_response =
        {:error, "Order not found."}

      assert response == expected_response
    end
  end
end
