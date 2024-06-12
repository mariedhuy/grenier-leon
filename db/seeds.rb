# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Item.destroy_all

user_1 = User.create(email:"vald@gmail.com", password:"totojnfvjkr")
item_1 = Item.create(name:"perceuse", category:"outil", description:"blabalbahbfrjehbre", picture:"https://im.qccdn.fr/node/guide-d-achat-perceuses-a-percussion-6299/thumbnail_800x480px-122138.jpg", user:user_1)


puts "Everything is done"
