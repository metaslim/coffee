class Payment
  attr_reader :user, :total_amount

  def initialize(user, amount)
    @user = user
    @total_amount += amount
  end

end