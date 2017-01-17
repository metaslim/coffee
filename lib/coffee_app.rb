require_relative 'factory/factory_packs'
require_relative 'model/user'

class CoffeeApp

  class << self

    def call(prices_json, orders_json, payments_json)
      User.reset_registry

      menu = Menu.create_from(prices_json)
      orders = OrdersFactory.create_from(orders_json)
      payments = PaymentsFactory.create_from(payments_json)

      get_customer_taps(menu, orders, payments).to_json

      User.to_hash.to_json
    end

    private

    def get_customer_taps(menu, orders, payments)
      customers = []
      orders.each do |order|
        user = order.user
        calculate_orders(user, menu, order)
        calculate_balance(user)
      end

      payments.each do |payment|
        user = payment.user
        calculate_payments(user, payment)
        calculate_balance(user)
      end
    end

    def calculate_orders(user, menu, order)
      user.make_order_from(menu, order)
    end

    def calculate_payments(user, payment)
      user.make_payment_of(payment.amount)
    end

    def calculate_balance(user)
      user.update_balance
    end
  end
end
