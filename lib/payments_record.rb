require_relative 'json_parser'
require_relative 'payment'

class PaymentsRecord
  attr_reader :payments

  class << self
    def create_from(data)
      new(data).payments
    end
  end

  PARSER = JsonParser

  def initialize(data)
    @payments = {}
    payments_array = parse(data)

    payments_array.each do |payment|
      user = payment['user']
      amount = payment['amount'].to_i


      @payments[user] = [] if @payments[user].nil?
      @payments[user] << Payment.new(
        user,
        amount
      )
    end

    self
  end

  private
  def parse(data)
    PARSER.parse(data)
  end
end