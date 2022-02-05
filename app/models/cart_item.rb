class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def subtotal
    item.add_tax_price.to_i * amount.to_i
  end

end
