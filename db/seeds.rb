puts "Clean"

Booking.destroy_all
User.destroy_all
Item.destroy_all

puts "new users"

kevin = User.create(name: "Kévin", address: "rue de paris", phone: "060000000", email: "kevin@gmail.com", password: "password")
marie = User.create(name: "Marie", address: "rue de paris", phone: "060000000", email: "marie@gmail.com", password: "password")
audrey = User.create(name: "Audrey", address: "rue de paris", phone: "060000000", email: "marie@gmail.com", password: "password")
valentin = User.create(name: "Valentin", address: "rue de paris", phone: "060000000", email: "marie@gmail.com", password: "password")

puts "new items"

perceuse = Item.create(name: "Perçeuse", category: "tools", description: "Super perçeuse", picture: "https://www.lidl.es/media/product/0/0/4/6/7/1/8/atornilladora-taladradora-electrica-zoom--1.jpg", user_id: kevin.id)
marteau = Item.create(name: "Marteau", category: "tools", description: "Vraiment très efficace", picture: "https://tuxelife.es/uploads/photo/image/9410/1708515488064_HIPPOTONIC2__1_.jpg", user_id: kevin.id)
tente_de_camping = Item.create(name: "Tente de camping", category: "tools", description: "Confortable", picture: "https://m.media-amazon.com/images/I/51op+LQO4ML._AC_UF894,1000_QL80_.jpg", user_id: marie.id)
plat_a_paella = Item.create(name: "Plat à paella", category: "cuisine", picture: "https://www.mauviel-boutique.com/452-large_default/plat-a-paella-m-steel.jpg", description: "plat à paella", user_id: marie.id)

puts "done"

puts "new bookings"

Booking.create(start_date: Date.new(2024, 3, 30), end_date: Date.new(2024, 4, 10), status: "Emprunt en cours", item_id: marteau.id, user_id: kevin.id)
Booking.create(start_date: Date.new(2024, 1, 12), end_date: Date.new(2024, 1, 23), status: "pending", item_id: plat_a_paella.id, user_id: kevin.id)
Booking.create(start_date: Date.new(2024, 2, 18), end_date: Date.new(2024, 3, 20), status: "Emprunt en cours", item_id: perceuse.id, user_id: marie.id)
Booking.create(start_date: Date.new(2024, 5, 02), end_date: Date.new(2024, 5, 12), status: "Emprunt en cours", item_id: tente_de_camping.id, user_id: kevin.id)
Booking.create(start_date: Date.new(2024, 6, 25), end_date: Date.new(2024, 7, 07), status: "Emprunt en cours", item_id: marteau.id, user_id: marie.id)

puts "done"
