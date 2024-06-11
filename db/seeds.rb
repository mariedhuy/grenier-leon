puts "Clean"

Item.destroy_all

puts "new items"

Item.create(name: "perceuse", category: "outil", picture: "https://m.media-amazon.com/images/I/71pXlp1+AlS._AC_SX679_.jpg", description: "description")
Item.create(name: "plat à paella", category: "cuisine", picture: "https://www.mauviel-boutique.com/452-large_default/plat-a-paella-m-steel.jpg", description: "plat à paella")
Item.create(name: "tente de camping", category: "loisir", description: "Confortable", picture: "https://m.media-amazon.com/images/I/51op+LQO4ML._AC_UF894,1000_QL80_.jpg")

puts "done"
