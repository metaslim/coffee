class Drink
  attr_reader :id, :drink_name, :price, :size

  def initialize(drink_name, size)
    @id = "#{size}_#{drink_name}"
    @drink_name = drink_name
    @size = size
  end
end
