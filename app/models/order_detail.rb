class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { a: 0, b: 1, c: 2, d: 3 }

  def subtotal
    price * amount
  end

end
