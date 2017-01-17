require_relative '../model/payment'
require_relative '../model/user'
require_relative 'factory'

class PaymentsFactory < Factory
  class << self

    private

    def generate(json)
      payments = []

      parse(json) do |payment|
        user = payment['user']
        amount = payment['amount'].to_f

        payments << Payment.new(
          User.create(user),
          amount
        )
      end
      payments
    end
  end
end
