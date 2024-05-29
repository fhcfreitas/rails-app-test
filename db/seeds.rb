# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = User.create!([
  { name: "User1", email: "user1@example.com", password: "123456", admin: false },
  { name: "User2", email: "user2@example.com", password: "123456", admin: false },
  { name: "Admin", email: "admin@example.com", password: "123456", admin: true }
])
 100.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    user_id: users.sample.id
  )
 end
