defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users.Agent, as: UsersAgent
  alias Exlivery.Users.User

  def call(%{name: name, address: address, email: email, cpf: cpf, age: age}) do
    name
    |> User.build(email, cpf, age, address)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UsersAgent.save(user)

    {:ok, "User created or updated successfully."}
  end

  defp save_user({:error, _reason} = error), do: error
end
