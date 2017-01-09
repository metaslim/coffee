class Order
  attr_reader :user, :drink, :size

  def initialize(user, drink, size)
    @user = user
    @drink = drink
    @size = size
  end
end