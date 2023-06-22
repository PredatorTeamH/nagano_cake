# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@example.com', password: 'password')

Genre.create(name: 'Cake')

item = Item.new(
  genre_id: 1,
  name: "milk cake",
  description: "シンプルながらも洗練されたデザインで、ミルクの芳醇な風味が鮮やかに広がる、大人のためのケーキです。",
  price: 1200,
  is_selling: true
)

image_file = File.open(Rails.root.join('app/assets/images/cake/milkcake.jpg'))
item.image.attach(io: image_file, filename: 'milkcake.jpg')
item.save!