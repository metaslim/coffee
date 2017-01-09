module DrinkMaker
  def self.create(drink_name, size)
    Class.new {
      define_method(:id) { "#{size}_#{drink_name}" }
      define_method(:drink_name) { drink_name }
      define_method(:size) { size }
    }.new
  end
end
