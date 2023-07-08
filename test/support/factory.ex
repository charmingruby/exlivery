defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "John Doe",
      email: "john@doe.com",
      address: "123 Main St",
      age: 64,
      cpf: "12345678912"
    }
  end

  def item_factory do
    %Item{
      description: "Niguiri",
      category: :japanese_food,
      quantity: 1,
      unity_price: Decimal.new("60.55")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "123 Main St",
      items: [
        build(:item),
        build(:item, description: "Temaki")
      ],
      total_price: Decimal.new("121.10"),
      user_cpf: "12345678912"
    }
  end
end
