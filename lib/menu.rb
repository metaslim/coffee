require_relative 'json_parser'
require_relative 'drink'
require_relative 'menu_item'

class Menu
  attr_reader :parser, :menu

  class << self
    def create_from(data)
      new(data)
    end
  end

  PARSER = JsonParser

  def initialize(data)
    @menu = {}
    drinks_array = parse(data)

    drinks_array.each do |drink|
      drink_name = drink['drink_name']
      @menu[drink_name] = {}

      drink['prices'].keys.each do |size|
        price = drink['prices'][size]
        offered_drink = Drink.new(drink_name, size)

        @menu[offered_drink.id] = MenuItem.new(
          offered_drink,
          price
        )
      end
    end

    @menu
  end

  def how_much_for?(order)
    drink = order.drink
    menu[drink.id].price
  end

  private
  def parse(data)
    PARSER.parse(data)
  end
end