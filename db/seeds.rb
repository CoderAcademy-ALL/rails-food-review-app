# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Starting seeding'
puts 'Destroying records'
User.destroy_all
Product.destroy_all
Brand.destroy_all
Tag.destroy_all
puts 'Records destroyed'

puts '-' * 20
puts 'Populating Users'
User.create(
  full_name: 'Daniel', 
  email: 'daniel@email.com', 
  status: 'admin' 
)
User.create(
  full_name: 'Jurek', 
  email: 'jurek@email.com', 
  status: 0
)
User.create(
  full_name: 'Ryan',
  email: 'ryan@email.com',
  status: 'active'
)
User.create(
  full_name:  'Joanna',
  email: 'joanna@email.com',
  status: 'deactivated'
)
puts 'User populated'

puts '-' * 20
puts 'Seeding brands'
4.times do |i|
  brand = Brand.create(name: "Brand#{i}")
  puts 'Seeding products'
  5.times do
    brand.products.create(
    name: Faker::Food.fruits, 
    description: Faker::Food.description,
    price: rand(1.00..100.00),
  )
  puts 'Products seeded'
  end
end
puts 'Brands seeded'

puts '-' * 20
rating_array = [{text: 'Nice', rating: 5},{text: 'Pretty Good', rating: 4}, {text: 'ok', rating:  3}, {text: 'could be better', rating: 2}, {text: 'bad', rating: 1}, { text: 'terrible', rating: 0 }]
puts 'Seeding reviews'
20.times do
  current_rating = rating_array.sample
  Review.create(review_text: current_rating[:text], rating: current_rating[:rating],
  user: User.all.sample,
  product: Product.all.sample)
end
puts 'Reviews seeded'
puts '-' * 20

puts 'Seeding completed'