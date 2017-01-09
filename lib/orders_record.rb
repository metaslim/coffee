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
        drink = order['drink']
        size = order['size']


        orders[user] = [] if orders[user].nil?
        orders[user] << Order.new(
          user,
          drink,
          size
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