class User
  attr_reader :user, :order_total, :payment_total, :balance

  def initialize(name)
    @user = name
    @order_total = 0
    @payment_total = 0
    @balance = 0
  end

  def make_order_from(menu, order)
    @order_total += get_price_from(menu, order)
    @order_total = @order_total.round(2)
  end

  def make_payment_of(amount)
    @payment_total += amount
    @payment_total = @payment_total.round(2)
  end

  def update_balance
    @balance = (order_total - payment_total)
  end

  def to_hash
    instance_variables.inject({}) do |hash, var|
      hash[var.to_s.delete("@")] = instance_variable_get(var)
      hash
    end
  end

  def get_price_from(menu, order)
    menu_item = order.drink
    menu[menu_item.id].price
  end
end
