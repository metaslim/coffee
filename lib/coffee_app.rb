require_relative 'factory_packs'
require_relative 'user'

class CoffeeApp

  class << self
    def call(prices_json, orders_json, payments_json)
      menu = Menu.create_from(prices_json)
      orders = OrdersFactory.create_from(orders_json)
      payments = PaymentsFactory.create_from(payments_json)

      get_customer_accounts(menu, orders, payments).to_json
    end

    private
    def get_customer_accounts(menu, orders, payments)
      customers = []
      orders.keys.each do |customer|
        user = User.new(customer)

        calculate_orders(user, menu, orders[customer])
        calculate_payments(user, payments[customer])
        calculate_balance(user)

        customers << user.to_hash
      end

      customers
    end

    def calculate_orders(user, menu, orders)
      return if orders.nil?

      orders.each do |order|
        user.make_order_from(menu, order)
      end
    end

    def calculate_payments(user, payments)
      return if payments.nil?

      payments.each do |payment|
        user.make_payment_of(payment.amount)
      end
    end

    def calculate_balance(user)
      user.update_balance
    end
  end
end
