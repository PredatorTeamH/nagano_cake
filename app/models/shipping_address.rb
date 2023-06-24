class ShippingAddress < ApplicationRecord
  
  belongs_to :customer
  
  def address_display
    '〒' + zip_code + ' ' + address
  end
  
  validates :zip_code, presence:true
  validates :address, presence:true
  validates :name, presence:true
  
end
