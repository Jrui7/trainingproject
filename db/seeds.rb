
=begin
User.destroy_all
jorge = User.create(admin: true, sex: "Homme", email: "jorge.ruivinho@me.com", password: "password", pseudo: "Jrui7", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504805315/chx9ggnqbpz9ojb9pjnb.jpg")
jennifer = User.create(sex: "Femme", email: "jenniferschwientek@gmail.com", password: "password", pseudo: "Jenny", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504809025/pfzlmedhzlieyalaczxr.jpg")
thomas = User.create(sex: "Homme", email: "studentouch@gmail.com", password: "password", pseudo: "SurfMousse", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505133796/sgb463x8acjlumv7ht86.jpg")

puts "Users created !"
puts "--------------------"




=end

Category.destroy_all

mode = Category.create(name: "Mode")
beauté = Category.create(name: "Beauté")
sport = Category.create(name: "Sport")
tech = Category.create(name: "Tech")
loisir = Category.create(name: "Loisirs & Sorties")
maison = Category.create(name: "Maison")
enfants = Category.create(name: "Enfants")
animaux = Category.create(name: "Animaux")
puts "Categories created !"
puts "--------------------"

# mode = Category.where(name: "Mode & Beauté").first
# sport = Category.where(name: "Sport").first
# tech = Category.where(name: "Tech").first
# loisir = Category.where(name: "Loisirs & Sorties").first
# maison = Category.where(name: "Maison").first
# enfants = Category.where(name: "Enfants").first
# animaux = Category.where(name: "Animaux").first



jorge = User.first
thomas = User.where(pseudo: "SurfMousse").first
onur = User.where(pseudo: "Onur").first



# j = Address.create(user_id: jorge.id, first_name: "Jorge", last_name: "Ruivinho", street: "64 rue de la Pompe", zip_code: "75116", city: "Paris")
# t = Address.create(user_id: thomas.id, first_name: "Thomas", last_name: "Caillol" street: "1 rue de la falaise", zip_code: "13000", city: "Marseille")

# puts "Addreses created !"
# puts "--------------------"




Seed.destroy_all

seed_mode = Seed.create(price: 150, official_description: "Produit polyvalent qui permet plein de choses que l'on ne peut imaginer à première vue", size_guide: "https://www.monsieurtshirt.com/informations/8-guide-des-tailles", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=5AhY_-qUb4w" , title: "T-shirt Psycha", expiration: DateTime.now.utc + 3.days, user_id: thomas.id, category_id: mode.id, description: "Avec ça Men, tu peux même parler boulot après 19h00", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509956287/hdecr3jxijppwsukhi0l.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1509623265/ridfuoa67vz6ewlb3zop.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_sport  = Seed.create(price: 100, official_description: "Produit polyvalent qui permet plein de choses que l'on ne peut imaginer à première vue", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=5AhY_-qUb4w" , title: "Le tube d'Hendaye", expiration: DateTime.now.utc + 3.days, user_id: thomas.id, category_id: sport.id, description: "Perso Ma Men, c'est les plus grosses vagues que j'ai ridé", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504544452/yxdwojuuq0q71p2oemmz.jpg"])
seed_tech = Seed.create(price: 250, official_description: "Produit polyvalent qui permet plein de choses que l'on ne peut imaginer à première vue", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=XkA6UAfmJjc" , title: "Pour être beau comme un prince", expiration: DateTime.now.utc + 2.days, user_id: jorge.id, category_id: tech.id, description: "C'est l'astuce pour transformer n'importe qui en super-model", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509787225/upljdsxonu1c9skxuemd.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_loisir = Seed.create(price: 200, official_description: "Produit polyvalent qui permet plein de choses que l'on ne peut imaginer à première vue", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=XkA6UAfmJjc" , title: "La balle fusion", expiration: DateTime.now.utc + 2.days, user_id: jorge.id, category_id: loisir.id, description: "Ca file au vent, pénétration idéale", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1504544452/yxdwojuuq0q71p2oemmz.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_maison = Seed.create(price: 300, official_description: "Produit polyvalent qui permet plein de choses que l'on ne peut imaginer à première vue", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=KNuUGEahHg8" , title: "L'oeuvre d'art des artistes", expiration: DateTime.now.utc + 4.days, user_id: onur.id, category_id: maison.id, description: "Franchement, je paye direct, c'est top", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1504619657/wmjrhxdqczonc6jbz9g0.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_enfants = Seed.create(price: 350, official_description: "Produit polyvalent qui permet plein de choses que l'on ne peut imaginer à première vue", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=VHYUjNh0T1w" , title: "Meilleure table vegan de Los Angeles", expiration: DateTime.now.utc + 4.days, user_id: onur.id, category_id:enfants.id, description: "Avec des plats comme ceux-ci, plus d'excuse pour ne pas tenter de changer son alimentation", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509986837/vegan_xiomv3.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_animaux = Seed.create(price: 400, official_description: "Produit polyvalent qui permet plein de choses que l'on ne peut imaginer à première vue", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=VHYUjNh0T1w" , title: "Test si ça marche", expiration: DateTime.now.utc + 1.minutes, user_id: onur.id, category_id: animaux.id, description: "Avec des plats comme ceux-ci, plus d'excuse pour ne pas tenter de changer son alimentation", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509986837/vegan_xiomv3.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])

puts "Seed created"
puts "----------------------"

campaign1 = Campaign.create(seed_id: seed_mode.id)
campaign2 = Campaign.create(seed_id: seed_sport.id)
campaign3 = Campaign.create(seed_id: seed_tech.id)
campaign4 = Campaign.create(seed_id: seed_loisir.id)
campaign5 = Campaign.create(seed_id: seed_maison.id)
campaign6 = Campaign.create(seed_id: seed_enfants.id)
campaign7 = Campaign.create(seed_id: seed_animaux.id)

puts "Campaigns created"
puts "-----------------------"

