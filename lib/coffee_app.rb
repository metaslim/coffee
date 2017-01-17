require_relative 'factory/factory_packs'
require_relative 'model/user'

class CoffeeApp

  class << self

    def call(prices_json, orders_json, payments_json)
      User.reset_registry

      menu = Menu.create_from(prices_json)
      orders = OrdersFactory.create_from(orders_json)
      payments = PaymentsFactory.create_from(payments_json)

      update_user_balance_from(orders, menu, Proc.new {|user, order, menu|
        user.make_order_from(menu, order)
      })

      update_user_balance_from(payments, menu, Proc.new {|user, payment|
        user.make_payment_of(payment.amount)
      })

      User.to_hash.to_json
    end

    private

    def update_user_balance_from(items, menu, proc)
      items.each do |item|
        user = item.user
        proc.call(user, item, menu)
        user.update_balance
      end
    end
  end
end
