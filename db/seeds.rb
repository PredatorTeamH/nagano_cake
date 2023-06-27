# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@example.com', password: 'password')

Genre.create(name: 'ケーキ')
Genre.create(name: 'パン')
Genre.create(name: 'プリン')
Genre.create(name: '焼き菓子')
Genre.create(name: 'キャンディ')

item1 = Item.new(
  genre_id: 1,
  name: "milk cake",
  description: "シンプルながらも洗練されたデザインで、ミルクの芳醇な風味が鮮やかに広がる、大人のためのケーキです。",
  price: 400,
  is_selling: true
)

image_file = File.open(Rails.root.join('app/assets/images/cake/milkcake.jpg'))
item1.image.attach(io: image_file, filename: 'milkcake.jpg')
item1.save!

item2 = Item.new(
  genre_id: 1,
  name: "strawberry cake",
  description: "鮮やかなイチゴの魅力が満載の、絶品のケーキをお届けいたします。華やかなビジュアルと口いっぱいに広がる甘酸っぱい風味で、心躍るひとときをお約束します。",
  price: 550,
  is_selling: true
)

image_file = File.open(Rails.root.join('app/assets/images/cake/strawberrycake.jpg'))
item2.image.attach(io: image_file, filename: 'strawberrycake.jpg')
item2.save!

item3 = Item.new(
  genre_id: 1,
  name: "matcha cake(one hole)",
  description: "鮮烈な抹茶の風味が広がる、贅沢な一品、抹茶ケーキをご紹介します。上品な抹茶の香りと豊かな味わいが調和し、口の中で踊る至福の舌触りをお楽しみいただけます。一口食べれば、上質な抹茶の魅力に包まれ、優雅なひとときをお過ごしいただけます。",
  price: 1150,
  is_selling: true
)

image_file = File.open(Rails.root.join('app/assets/images/cake/matchacake.jpg'))
item3.image.attach(io: image_file, filename: 'matchacake.jpg')
item3.save!

item4 = Item.new(
  genre_id: 1,
  name: "berry cheese cake",
  description: "滑らかでクリーミーなチーズケーキのベースに、豊かな味わいのベリーがアクセントとなっています。ほんのり甘いスポンジケーキの下には、口溶けの良いチーズケーキクリームが広がります。その上には新鮮なベリーがたっぷりと乗せられています。ベリーの自然な甘みと酸味がチーズケーキと相性よく調和し、口の中で絶妙なバランスを楽しむことができます。",
  price: 500,
  is_selling: true
)

image_file = File.open(Rails.root.join('app/assets/images/cake/cheesecake-with-blueberries-and-raspberries.jpg'))
item4.image.attach(io: image_file, filename: 'cheesecake-with-blueberries-and-raspberries.jpg')
item4.save!

item5 = Item.new(
  genre_id: 2,
  name: "creamcheese in buns",
  description: "クリームチーズパンは、滑らかでクリーミーなクリームチーズがパンのベースとなり、豊かな味わいのベリーがアクセントとなるスイーツです。ふんわりとした甘さのあるパン生地の中には、口溶けの良いクリームチーズがたっぷりと詰まっています。",
  price: 200,
  is_selling: true
)

image_file = File.open(Rails.root.join('app/assets/images/cake/buns-with-cream-cheese-inside.jpg'))
item5.image.attach(io: image_file, filename: 'buns-with-cream-cheese-inside.jpg')
item5.save!

customer = Customer.new(
  email: "customer1@example.com",
  password: "yamada",
  last_name: "山田",
  first_name: "太郎",
  last_kana_name: "ヤマダ",
  first_kana_name: "タロウ",
  zip_code: "1234567",
  address: "東京都渋谷区1-2-3",
  phone_number: "09012345678",
  is_active: true
)

Customer.create!(
  email: "customer2@example.com",
  password: "satohanako",
  last_name: "佐藤",
  first_name: "花子",
  last_kana_name: "サトウ",
  first_kana_name: "ハナコ",
  zip_code: "9876543",
  address: "大阪府大阪市4-5-6",
  phone_number: "08098765432",
  is_active: true
)

Customer.create!(
  email: "customer3@example.com",
  password: "suzuki",
  last_name: "鈴木",
  first_name: "次郎",
  last_kana_name: "スズキ",
  first_kana_name: "ジロウ",
  zip_code: "5678901",
  address: "京都府京都市7-8-9",
  phone_number: "07012345678",
  is_active: true
)

10.times do |n|
  email = "customer#{n + 4}@example.com"
  password = "password#{n + 4}"
  last_name = "苗字#{n + 4}"
  first_name = "名前#{n + 4}"
  last_kana_name = "ミョウジ#{n + 4}"
  first_kana_name = "ナマエ#{n + 4}"
  zip_code = "1112222"
  address = "都道府県#{n + 4}番地"
  phone_number = "0801234#{n + 5}#{n + 6}#{n + 8}#{n + 4}"
  is_active = true

  Customer.create!(
    email: email,
    password: password,
    last_name: last_name,
    first_name: first_name,
    last_kana_name: last_kana_name,
    first_kana_name: first_kana_name,
    zip_code: zip_code,
    address: address,
    phone_number: phone_number,
    is_active: is_active
  )
end

11.times do |n|
  customer_id = 2
  shipping_zip_code = '123-4567'
  shipping_address = '東京都渋谷区'
  address_name = '山田太郎'
  payment_method = 1
  freight = 800
  total_price = Item.find(1).price + 800
  status = 0

  order = Order.create!(
    customer_id: customer_id,
    shipping_zip_code: shipping_zip_code,
    shipping_address: shipping_address,
    address_name: address_name,
    payment_method: payment_method,
    freight: freight,
    total_price: total_price,
    status: status
  )

  10.times do
    item_id = 1
    quantity = 10
    tax_in_price = Item.find(1).price
    status = 0

    OrderItem.create!(
      order_id: order.id,
      item_id: item_id,
      quantity: quantity,
      tax_in_price: tax_in_price,
      status: status
    )
  end
end
