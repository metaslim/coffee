class Drink
  attr_reader :drink_name, :price, :size

  def initialize(drink_name, size, price)
    @drink_name = drink_name
    @size = size
    @price = price
  end

end