class Drink
  attr_reader :id, :drink_name, :price, :size

  def initialize(drink_name, size)
    @id = "#{drink_name}_#{size}"
    @drink_name = drink_name
    @size = size
  end
end
