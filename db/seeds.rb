# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Item.create(name: "perçeuse", category: "tools", description: "Super perçeuse", picture: "https://www.lidl.es/media/product/0/0/4/6/7/1/8/atornilladora-taladradora-electrica-zoom--1.jpg")
Item.create(name: "marteau", category: "tools", description: "Vraiment très efficace", picture: "https://tuxelife.es/uploads/photo/image/9410/1708515488064_HIPPOTONIC2__1_.jpg")
Item.create(name: "tente de camping", category: "tools", description: "Confortable", picture: "https://m.media-amazon.com/images/I/51op+LQO4ML._AC_UF894,1000_QL80_.jpg")
Item.create(name: "plat à paella", category: "cuisine", picture: "https://www.mauviel-boutique.com/452-large_default/plat-a-paella-m-steel.jpg", description: "plat à paella")
