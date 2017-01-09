require "minitest/autorun"
require_relative '../../lib/model/payment'

class TestPayment < Minitest::Test
  attr_reader :payment, :user, :amount

  def setup
    @amount = 33.50
    @user = "welly"
    @payment = Payment.new(user, amount)
  end

  def test_object_constructed
    assert_equal amount , payment.amount
  end
end