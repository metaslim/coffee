require 'test_helper'
require_relative '../../lib/model/payment'

class PaymentTest < Minitest::Test
  attr_reader :payment, :user, :amount

  def setup
    @amount = 33.50
    @user = FakeMaker.create_user("welly")
    @payment = Payment.new(user, amount)
  end

  def test_object_constructed
    assert_equal user , payment.user
    assert_equal amount , payment.amount
  end
end