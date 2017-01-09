require "minitest/autorun"
require_relative '../../lib/model/order'
require_relative 'drink_maker'
require_relative 'user_maker'

class TestOrder < Minitest::Test
  attr_reader :order, :drink, :user, :size, :drink_name

  def setup
    @drink_name = "mocha"
    @size = "large"
    @user = UserMaker.create("welly")
    @drink = DrinkMaker.create(drink_name, size)
    @order = Order.new(user, drink)
  end

  def test_object_constructed
    assert_equal user, order.user
    assert_equal drink , order.drink
  end
end