require_relative 'json_parser'
require_relative 'order'

class OrdersRecord
  class << self
    @@parser = JsonParser

    def create(data)
      orders = {}
      orders_array = parse(data)

      orders_array.each do |order|
        user = order['user']
        drink_name = order['drink']
        drink_size = order['size']


        orders[user] = [] if orders[user].nil?

        drink = Drink.new(
          drink_name,
          drink_size
        )

        orders[user] << Order.new(
          user,
          drink
        )
      end

      orders
    end

    private
    def parse(data)
      @@parser.parse(data)
    end

  end
end