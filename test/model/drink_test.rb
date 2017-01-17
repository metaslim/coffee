require 'test_helper'
require_relative '../../lib/model/drink'

class DrinkTest < Minitest::Test
  attr_reader :drink, :drink_name, :size, :id

  def setup
    @drink_name = "mocha"
    @size = "large"
    @id = "#{size}_#{drink_name}"
    @drink = Drink.create(drink_name, size)
  end

  def test_object_constructed
    assert_equal id, drink.id
    assert_equal drink_name, drink.drink_name
    assert_equal size, drink.size
  end
end