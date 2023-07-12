defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UsersAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      UsersAgent.start_link(%{})

      user = build(:user)

      assert UsersAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UsersAgent.start_link(%{})

      :ok
    end

    test "when the user is found, return the user" do
      :user
      |> build(cpf: "12345678900")
      |> UsersAgent.save()

      response = UsersAgent.get("12345678900")

      expected_response =
        {:ok,
         %User{
           address: "123 Main St",
           age: 64,
           cpf: "12345678900",
           email: "john@doe.com",
           name: "John Doe"
         }}

      assert response == expected_response
    end

    test "when the user is not found, return an error" do
      response = UsersAgent.get("00000000000")

      expected_response = {:error, "User not found."}

      assert response == expected_response
    end
  end
end
