require_relative '../model/payment'
require_relative 'factory'

class PaymentsFactory < Factory
  class << self

    private

    def generate(json)
      payments = {}

      parse(json) do |payment|
        user = payment['user']
        amount = payment['amount'].to_f

        payments[user] = [] if payments[user].nil?
        payments[user] << Payment.new(
          user,
          amount
        )
      end

      payments
    end
  end
end