module UserMaker
  def self.create(name)
    Class.new {
      define_method(:user) { name }
      define_method(:order_total) { 0 }
      define_method(:payment_total) { 0 }
      define_method(:balance) { 0 }
    }.new
  end
end
