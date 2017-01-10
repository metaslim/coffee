require 'test_helper'
require_relative '../../lib/factory/orders_factory'
require_relative '../../lib/model/order'


class OrdersFactoryTest < Minitest::Test
  attr_reader :orders

  def setup
    @orders = OrdersFactory.create_from(JsonSample::orders_json)
  end

  def test_orders_is_correct_size
    assert_equal 4, orders.size
  end

  def test_coach_has_2_orders
    assert_equal 2, orders["coach"].size
  end

  def test_coach_ordered_medium_long_black
    assert_equal "medium", orders["coach"].first.drink.size
    assert_equal "long black", orders["coach"].first.drink.drink_name
  end

  def test_coach_ordered_large_flat_white
    assert_equal "large", orders["coach"].last.drink.size
    assert_equal "flat white", orders["coach"].last.drink.drink_name
  end

  def test_welly_not_ordered
    assert_nil orders["welly"]
  end

  def test_item_is_order
    assert_instance_of Order, orders["coach"].first
  end

  def test_orders_with_wrong_json
    assert_raises(JSON::ParserError) { OrdersFactory.create_from("") }
  end
end