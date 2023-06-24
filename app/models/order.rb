class Order < ApplicationRecord
  
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_items
  
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirm: 1, production: 2, preparation: 3, sent: 4 }

end
