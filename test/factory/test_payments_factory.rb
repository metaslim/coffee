require "minitest/autorun"
require_relative '../../lib/factory/payments_factory'
require_relative '../../lib/model/payment'
require_relative '../json_sample'

class TestPaymentsFactory < Minitest::Test
  attr_reader :payments

  def setup
    @payments = PaymentsFactory.create_from(JsonSample::payments_json)
  end

  def test_payments_is_correct_size
    assert_equal 3, payments.size
  end

  def test_rochelle_has_correct_amount
    assert_equal 4.50, payments["rochelle"].first.amount
  end

  def test_welly_has_not_paid
    assert_nil payments["welly"]
  end

  def test_item_is_payment
    assert_instance_of Payment, payments["rochelle"].first
  end

  def test_payments_with_wrong_json
    assert_raises(JSON::ParserError) { PaymentsFactory.create_from("") }
  end
end