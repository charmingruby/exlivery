defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UsersAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UsersAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      user_params = %{
        name: "John Doe",
        address: "Ottawa, 23",
        email: "john@doe.com",
        cpf: "12345678900",
        age: 20
      }

      response = CreateOrUpdate.call(user_params)

      expected_response = {:ok, "User created or updated successfully."}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      user_params = %{
        name: "John Doe",
        address: "Ottawa, 23",
        email: "john@doe.com",
        cpf: "12345678900",
        age: 15
      }

      response = CreateOrUpdate.call(user_params)

      expected_response = {:error, "Invalid parameters."}

      assert response == expected_response
    end
  end
end
