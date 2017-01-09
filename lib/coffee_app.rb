require_relative 'drinks_factory.rb'
require 'pry'

class CoffeeApp

  class << self
    def call(prices_json, orders_json, payments_json)
      drinks = DrinksFactory.create(prices_json)
      payments = PaymentsFactory.create(payments_json)
      binding.pry
    end
  end
end