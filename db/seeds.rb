# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@example.com', password: 'password')

Genre.create(name: 'Cake')

item1 = Item.new(
  genre_id: 1,
  name: "milk cake",
  description: "シンプルながらも洗練されたデザインで、ミルクの芳醇な風味が鮮やかに広がる、大人のためのケーキです。",
  price: 1200,
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