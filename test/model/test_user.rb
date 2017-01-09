require "minitest/autorun"
require_relative '../../lib/model/user'
require_relative 'fake_maker'

class TestModel < Minitest::Test
  attr_reader :user, :user_name

  def setup
    @user_name = "welly"
    @user = User.new(user_name)
  end

  def test_object_constructed
    assert_equal user_name, user.user
  end

  def test_make_payment_of
    amount = 44.50
    user.make_payment_of(amount)
    assert_equal amount, user.payment_total
  end

  def test_make_order_from
    amount = 13.50

    drink_name = "mocha"
    size = "large"
    drink = FakeMaker.create_drink(drink_name, size)
    order = FakeMaker.create_order(user, drink)

    user.stub :get_price_from, (amount) do
      user.make_order_from(amount, order)
      assert_equal amount, user.order_total
    end
  end

  def test_update_balance
    order_total = 100
    payment_total = 55
    balance = order_total - payment_total

    user.stub :order_total, (order_total) do
      user.stub :payment_total, (payment_total) do
        user.update_balance
        assert_equal balance, user.balance
      end
    end
  end

  def test_get_price_from
    drink_name = "mocha"
    size = "large"
    price = 3.50
    drink = FakeMaker.create_drink(drink_name, size)
    order = FakeMaker.create_order(user, drink)
    menu = FakeMaker.create_menu(drink.id, price)
    assert_equal price, user.get_price_from(menu, order)
  end
end