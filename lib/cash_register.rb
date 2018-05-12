require "pry"
class CashRegister
  attr_accessor :total
  attr_reader :discount
  attr_accessor :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @all_items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @last_transaction = price * quantity
    quantity.times {@all_items << title}
    @total += price * quantity
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @discount_amt = @total * @discount/100
      @total -= @discount_amt
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
