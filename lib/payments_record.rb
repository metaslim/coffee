require_relative 'json_parser'
require_relative 'payment'

class PaymentsRecord
  class << self
    @@parser = JsonParser

    def create(data)
      payments = {}
      payments_array = parse(data)

      payments_array.each do |payment|
        user = payment['user']
        amount = payment['amount'].to_i

        # payments[user] = {} if payments[user].nil?

        payments[user] = [] if payments[user].nil?
        payments[user] << Payment.new(
          user,
          amount
        )

        #payments[user]["total_amount"] = 0 if payments[user]["total_amount"].nil?
        #payments[user]["total_amount"] += amount
      end

      payments
    end

    private
    def parse(data)
      @@parser.parse(data)
    end

  end
end