require 'test_helper'
require_relative '../../lib/model/order'

class OrderTest < Minitest::Test
  attr_reader :order, :drink, :user

  def setup
    drink_name = "mocha"
    size = "large"
    @user = FakeMaker.create_user("welly")
    @drink = FakeMaker.create_drink(drink_name, size)
    @order = Order.new(user, drink)
  end

  def test_object_constructed
    assert_equal user, order.user
    assert_equal drink , order.drink
  end
end