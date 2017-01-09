require "minitest/autorun"
require_relative '../../lib/model/menu_item'
require_relative 'fake_maker'

class TestMenuItem < Minitest::Test
  attr_reader :menu_item, :drink, :price

  def setup
    drink_name = "mocha"
    size = "large"
    @price = 3.50
    @drink = FakeMaker.create_drink(drink_name, size)
    @menu_item = MenuItem.new(drink, price)
  end

  def test_object_constructed
    assert_equal drink, menu_item.drink
    assert_equal price , menu_item.price
  end
end