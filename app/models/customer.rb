class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def customer_address_display
    '〒' + zip_code + ' ' + address
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, length: { minimum:2, maximum:20 }, presence:true 
  validates :first_name, length: { minimum:2, maximum:20 }, presence:true
  validates :last_kana_name, length: { minimum:2, maximum:20 }, presence:true
  validates :first_kana_name, length: { minimum:2, maximum:20 }, presence:true
  validates :zip_code, presence:true
  validates :address, presence:true
  validates :phone_number, presence:true, uniqueness: true
  validates :email,  presence:true, uniqueness: true
  validates :encrypted_password, presence:true
end
