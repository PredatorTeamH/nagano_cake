class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  def customer_address_display
    '〒' + zip_code + ' ' + address
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, length: { minimum:2, maximum:20 }, uniqueness: true
  validates :first_name, length: { minimum:2, maximum:20 }, uniqueness: true
  validates :last_kana_name, length: { minimum:2, maximum:20 }, uniqueness: true
  validates :first_kana_name, length: { minimum:2, maximum:20 }, uniqueness: true
  validates :zip_code, uniqueness: true
  validates :address, uniqueness: true
  validates :phone_number, uniqueness: true
  validates :email, uniqueness: true
  validates :encypted_password, uniqueness: true
end
