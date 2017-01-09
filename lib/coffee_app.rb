require_relative 'menu.rb'
require_relative 'payments_record.rb'
require_relative 'orders_record.rb'
require_relative 'user.rb'

require 'pry'

class CoffeeApp

  class << self
    def call(prices_json, orders_json, payments_json)
      menu = Menu.create_from(prices_json)
      orders = OrdersRecord.create_from(orders_json)
      payments = PaymentsRecord.create_from(payments_json)
      customers = {}

      orders.keys.each do |customer|
        user = User.new(customer)
        user.read_menu(menu)

        orders[customer].each do |order|
          user.make_order(order)
        end

        payments[customer].each do |payment|
          user.make_payment(payment)
        end

        puts "#{customer}\t#{user.balance}\t#{user.payment_total}\t#{user.order_total}"

        customers[customer] = user
      end
    end
  end
end