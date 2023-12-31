class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def tax_included_price
    (price * 1.1).floor
  end

  def get_image_fill(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  def get_image_fit(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end
end