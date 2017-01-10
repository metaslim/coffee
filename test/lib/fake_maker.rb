module FakeMaker
  def self.create_order(user, drink)
    Class.new {
      define_method(:user) { user }
      define_method(:drink) { drink }
    }.new
  end

  def self.create_drink(drink_name, size)
    Class.new {
      define_method(:id) { "#{size}_#{drink_name}" }
      define_method(:drink_name) { drink_name }
      define_method(:size) { size }
    }.new
  end

  def self.create_user(name)
    Class.new {
      define_method(:user) { name }
      define_method(:order_total) { 0 }
      define_method(:payment_total) { 0 }
      define_method(:balance) { 0 }
    }.new
  end


  def self.create_menu(id, price)
    menu = {}
    menu[id] = Class.new {
      define_method(:price) { price }
    }.new
    menu
  end
end
