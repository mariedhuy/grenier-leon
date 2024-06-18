puts "Clean"

Item.destroy_all

puts "new items"

Item.create(name: "perçeuse", category: "tools", description: "Super perçeuse", picture: "https://www.lidl.es/media/product/0/0/4/6/7/1/8/atornilladora-taladradora-electrica-zoom--1.jpg", user_id: 11)
Item.create(name: "marteau", category: "tools", description: "Vraiment très efficace", picture: "https://tuxelife.es/uploads/photo/image/9410/1708515488064_HIPPOTONIC2__1_.jpg", user_id: 11)
Item.create(name: "tente de camping", category: "tools", description: "Confortable", picture: "https://m.media-amazon.com/images/I/51op+LQO4ML._AC_UF894,1000_QL80_.jpg", user_id: 11)
Item.create(name: "plat à paella", category: "cuisine", picture: "https://www.mauviel-boutique.com/452-large_default/plat-a-paella-m-steel.jpg", description: "plat à paella", user_id: 11)
Item.create(name: "pelle", category: "outil", picture: "https://www.manutan.fr/fstrz/r/s/www.manutan.fr/img/S/GRP/ST/AIG7124353.jpg?frz-v=110", description: "Sert à creuser", user_id: 12)
Item.create(name: "Taille haie", category: "outil", picture: "https://www.cdiscount.com/pdt2/2/9/6/1/700x700/drf9037855079296/rw/luxueux-magnifique-taille-haie-thermique-puissan.jpg", description: "Pour tailler une haie façon louis 14", user_id: 13)

puts "done"
