puts "Clean"

Item.destroy_all

puts "new items"

Item.create(name: "perçeuse", category: "tools", description: "Super perçeuse", picture: "https://www.lidl.es/media/product/0/0/4/6/7/1/8/atornilladora-taladradora-electrica-zoom--1.jpg")
Item.create(name: "marteau", category: "tools", description: "Vraiment très efficace", picture: "https://tuxelife.es/uploads/photo/image/9410/1708515488064_HIPPOTONIC2__1_.jpg")
Item.create(name: "tente de camping", category: "tools", description: "Confortable", picture: "https://m.media-amazon.com/images/I/51op+LQO4ML._AC_UF894,1000_QL80_.jpg")
Item.create(name: "plat à paella", category: "cuisine", picture: "https://www.mauviel-boutique.com/452-large_default/plat-a-paella-m-steel.jpg", description: "plat à paella")

puts "done"