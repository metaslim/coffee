class User
  attr_reader :name, :menu, :payment_total, :order_total

  def initialize(name)
    @name = name
    @order_total = 0
    @payment_total = 0
    @balance = 0
  end

  def read_menu(menu)
    @menu = menu
  end

  def make_order(order)
    @order_total += menu.how_much_for?(order)
  end

  def make_payment(payment)
    @payment_total += payment.amount
  end

  def balance
    order_total - payment_total
  end
end