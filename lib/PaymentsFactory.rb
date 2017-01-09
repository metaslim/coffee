require_relative 'json_parser'
require_relative 'payment'

class PaymentsFactory
  class << self
    @@parser = JsonParser

    def create(data)
      payments = {}
      payments_array = parse(data)

      payments_array.each do |payment|
        user = payment['user']
        amount = payment['amount']

        payments[user] += amount
      end

      payments
    end

    private
    def parse(data)
      @@parser.parse(data)
    end

  end
end