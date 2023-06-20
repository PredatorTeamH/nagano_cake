class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  def customer_address_display
    '〒' + zip_code + ' ' + address
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
