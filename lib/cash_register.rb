require "pry"

class CashRegister

  attr_accessor :total, :last_transaction, :discount, :items


  def initialize(discount =0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @title = title
    self.total += price * quantity
    quantity.times do
      self.items << title
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      total_discount = (total * discount/100).to_i
        self.total = total - total_discount
        "After the discount, the total comes to $#{self.total}."
      end
    end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
