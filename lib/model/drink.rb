class Drink
  attr_reader :id, :drink_name, :price, :size

  @registry = {}

  class << self
    def create(drink_name, size)
      @registry["#{size}_#{drink_name}"] || new(drink_name, size).register
    end

    def registry
      @registry
    end

    def reset_registry
      @registry = {}
    end
  end

  def initialize(drink_name, size)
    @id = "#{size}_#{drink_name}"
    @drink_name = drink_name
    @size = size
  end

  def register
    self.class.registry[id] = self
  end
end
