require "minitest/autorun"
require_relative '../../lib/factory/menu'
require_relative '../../lib/model/menu_item'
require_relative '../json_sample'

class TestMenu< Minitest::Test
  attr_reader :menu

  def setup
    @menu = Menu.create_from(JsonSample::prices_json)
  end

  def test_menu_is_correct_size
    assert_equal 16, menu.size
  end

  def test_small_latte_has_correct_price
    assert_equal 3.50, menu["small_latte"].price
  end

  def test_small_latte_has_correct_name
    assert_equal "latte", menu["small_latte"].drink.drink_name
  end

  def test_small_latte_has_correct_size
    assert_equal "small", menu["small_latte"].drink.size
  end

  def test_item_is_menu_item
    assert_instance_of MenuItem, menu["small_latte"]
  end

  def test_menu_with_wrong_json
    assert_raises(JSON::ParserError) { Menu.create_from("") }
  end
end