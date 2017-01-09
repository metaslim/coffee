require_relative 'json_parser'
require_relative 'order'

class OrdersRecord
  attr_reader :orders

  class << self
    def create_from(data)
      new(data).orders
    end
  end

  PARSER = JsonParser

  def initialize(data)
    @orders = {}
    orders_array = parse(data)

    orders_array.each do |order|
      user = order['user']
      drink_name = order['drink']
      drink_size = order['size']


      @orders[user] = [] if @orders[user].nil?

      drink = Drink.new(
        drink_name,
        drink_size
      )

      @orders[user] << Order.new(
        user,
        drink
      )
    end

    self
  end

  private
  def parse(data)
    PARSER.parse(data)
  end
end