class User
  attr_reader :orders, :payment

  def add_order(order)
    @orders << order
  end

  def make_payment(payment)
    @payment = payment
  end
end