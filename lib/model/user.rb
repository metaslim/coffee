class User
  attr_reader :name, :order_total, :payment_total, :balance

  @registry = {}

  class << self
    def create(name)
      @registry[name] || new(name).register
    end

    def to_hash
      @registry.inject([]) do |array, user|
        user = user[1]
        array << {
          user: user.name,
          order_total: user.order_total,
          payment_total: user.payment_total,
          balance: user.balance
        }
      end
    end

    def registry
      @registry
    end

    def reset_registry
      @registry = {}
    end
  end

  def initialize(name)
    @name = name
    @order_total = 0
    @payment_total = 0
    @balance = 0
  end

  def make_order_from(menu, order)
    @order_total += get_price_from(menu, order)
    @order_total = @order_total.round(2)
  end

  def make_payment_of(amount)
    @payment_total += amount
    @payment_total = @payment_total.round(2)
  end

  def update_balance
    @balance = (order_total - payment_total)
  end

  def get_price_from(menu, order)
    menu_item = order.drink
    menu[menu_item.id].price
  end

  def register
    self.class.registry[name] = self
  end
end
