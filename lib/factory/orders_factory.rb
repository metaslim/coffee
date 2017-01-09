require_relative '../model/order'
require_relative '../model/drink'
require_relative '../model/user'
require_relative 'factory'

class OrdersFactory < Factory
  class << self

    private

    def generate(json)
      orders = {}

      parse(json) do |order|
        user = order['user']
        drink_name = order['drink']
        drink_size = order['size']

        orders[user] = [] if orders[user].nil?
        orders[user] << Order.new(
          User.new(user),
          Drink.new(drink_name, drink_size)
        )
      end
      orders
    end
  end
end
