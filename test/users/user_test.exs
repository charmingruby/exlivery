defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns an user" do
      response =
        User.build("John Doe", "john@doe.com", "12345678912", 64, "123 Main St")

      expected_response =
        {:ok, build(:user)}

      assert response == expected_response
    end

    test "when params are invalid, returns an error" do
      response =
        User.build("John Doe", "john@doe.com", "12345678912", 15, "123 Main St")

      expected_response = {:error, "Invalid parameters."}

      assert response == expected_response
    end
  end
end
