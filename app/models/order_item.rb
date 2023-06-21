class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  
  def calculate_subtotal
    self.subtotal = item.price * quantity
  end
end
