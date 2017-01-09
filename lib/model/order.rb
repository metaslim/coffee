class Order
  attr_reader :user, :drink

  def initialize(user, drink)
    @user = user
    @drink = drink
  end
end
