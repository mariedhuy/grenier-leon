puts "clean"

Item.destroy_all
User.destroy_all

puts "new users"

kevin = User.create(name: "Kévin", address: "Paris", phone: "060000000", email: "kevin@gmail.com", password: "password", avatar:"https://avatars.githubusercontent.com/u/159252673?v=4")
marie = User.create(name: "Marie", address: "Saint-Germain-en-Laye", phone: "060000000", email: "marie@gmail.com", password: "password", avatar:"https://avatars.githubusercontent.com/u/155112860?v=4")
audrey = User.create(name: "Audrey", address: "Barcelone", phone: "060000000", email: "audrey@gmail.com", password: "password", avatar:"https://avatars.githubusercontent.com/u/92102977?v=4")
valentin = User.create(name: "Valentin", address: "Peillonnex", phone: "060000000", email: "valentin@gmail.com", password: "password", avatar:"https://avatars.githubusercontent.com/u/159618368?v=4")

puts "new items"

perceuse = Item.create(name: "Perçeuse", category: "Outils", description: "Super perçeuse", picture: "https://www.lidl.es/media/product/0/0/4/6/7/1/8/atornilladora-taladradora-electrica-zoom--1.jpg", user_id: valentin.id)
marteau = Item.create(name: "Marteau", category: "Outils", description: "Vraiment très efficace", picture: "https://tuxelife.es/uploads/photo/image/9410/1708515488064_HIPPOTONIC2__1_.jpg", user_id: kevin.id)
tente = Item.create(name: "Tente de camping", category: "Loisirs", description: "Confortable", picture: "https://m.media-amazon.com/images/I/51op+LQO4ML._AC_UF894,1000_QL80_.jpg", user_id: audrey.id)
paella = Item.create(name: "Plat à paella", category: "Cuisine", picture: "https://www.mauviel-boutique.com/452-large_default/plat-a-paella-m-steel.jpg", description: "Excellent état ! Jusqu'à 20 personnes.", user_id: marie.id)
tournevis = Item.create(name: "Tournevis", category: "Outils", picture: "https://www.universoutils.com/153-large_default/tournevis-cruciforme-ph1.jpg", description: "Tourne bien", user_id: audrey.id)
taillehaie = Item.create(name: "Taille haie", category: "Outils", picture: "https://media.ouest-france.fr/v1/pictures/MjAxNzA2NDRlZDFiNGI3MDYxODc3NzJhYjcyYjk2MDRiMWVjYWY", description: "Pour tailler des haies façon Louis XIV", user_id: valentin.id)



puts "done"
