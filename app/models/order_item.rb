class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum status: { impossible: 0, waiting: 1, making: 2, completion: 3 }
  
  def subtotal
     item.with_tax_price * quantity
  end
end