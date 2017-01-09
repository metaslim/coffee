require_relative 'menu.rb'
require_relative 'payments_record.rb'
require 'pry'

class CoffeeApp

  class << self
    def call(prices_json, orders_json, payments_json)
      menu = Menu.create(prices_json)
      orders = Order.create(orders_json)
      payments = PaymentsRecord.create(payments_json)
    end
  end
end