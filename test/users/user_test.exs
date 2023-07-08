defmodule ExliveryTest.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "should return the user if the params are valid" do
      response =
        User.build("John Doe", "johndoe@email.com", "12345678912", 20, "Toronto, 17th street")

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Toronto, 17th street",
           age: 20,
           cpf: "12345678912",
           email: "johndoe@email.com",
           name: "John Doe"
         }}

      assert response == expected_response
    end

    test "should return an error if params are invalid" do
      response =
        User.build("John Doe", "johndoe@email.com", "12345678912", 15, "Toronto, 17th street")

      expected_response = {:error, "Invalid parameters."}

      assert response == expected_response
    end
  end
end
