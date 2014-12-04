# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
#....
Product.create!(
  title: 'Toyota Headlight',
  description: %{Buy a Toyota Headlight from us!},
  image_url: 'ToyotaHeadlight.jpg',
  price: 3500.00
 )