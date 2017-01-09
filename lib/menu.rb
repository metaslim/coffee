require_relative 'drink'
require_relative 'menu_item'
require_relative 'factory'

class Menu < Factory
  class << self

    private

    def generate(json)
      menu = {}

      parse(json) do |drink|
        drink_name = drink['drink_name']

        drink['prices'].keys.each do |size|
          price = drink['prices'][size].to_f
          offered_drink = Drink.new(drink_name, size)

          menu[offered_drink.id] = MenuItem.new(
            offered_drink,
            price
          )
        end
      end

      menu
    end
  end
end