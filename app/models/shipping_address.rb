class ShippingAddress < ApplicationRecord
  
  belongs_to :customer
  
  validates :zip_code, presence:true
  validates :address, presence:true
  validates :name, presence:true
  
end
