require 'test_helper'
require_relative '../../lib/factory/payments_factory'
require_relative '../../lib/model/payment'

class PaymentsFactoryTest < Minitest::Test
  attr_reader :payments

  def setup
    @payments = PaymentsFactory.create_from(JsonSample::payments_json)
  end

  def test_payments_is_correct_size
    assert_equal 4, payments.size
  end

  def test_rochelle_has_correct_amount
    assert_equal 4.50,
      payments.select {|payment| payment.user.name == "rochelle"}.first.amount
  end


  def test_item_is_payment
    assert_instance_of Payment, payments.first
  end

  def test_payments_with_wrong_json
    assert_raises(JSON::ParserError) { PaymentsFactory.create_from("") }
  end
end