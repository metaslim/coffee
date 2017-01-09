require_relative 'json_parser'
require_relative 'drink'

class Menu
  class << self
    @@parser = JsonParser

    def create(data)
      drinks = {}
      drinks_array = parse(data)

      drinks_array.each do |drink|
        drink_name = drink['drink_name']
        drinks[drink_name] = {}

        drink['prices'].keys.each do |size|
          price = drink['prices'][size]

          drinks[drink_name][size] = Drink.new(
            drink_name,
            size,
            price
          )
        end
      end

      drinks
    end

    private
    def parse(data)
      @@parser.parse(data)
    end

  end
end