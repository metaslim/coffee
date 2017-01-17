require_relative '../model/order'
require_relative '../model/drink'
require_relative '../model/user'
require_relative 'factory'

class OrdersFactory < Factory
  class << self

    private

    def generate(json)
      orders = []

      parse(json) do |order|
        user = order['user']
        drink_name = order['drink']
        drink_size = order['size']

        orders << Order.new(
          User.create(user),
          Drink.create(drink_name, drink_size)
        )
      end
      orders
    end
  end
end
