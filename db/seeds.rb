# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Category.destroy_all

mode = Category.create(name: "Mode")
beauté = Category.create(name: "Beaute")
art = Category.create(name: "Art")
sorties = Category.create(name: "Sorties")
sport = Category.create(name: "Sport")
loisir = Category.create(name: "Loisir")


puts "Categories created !"
puts "--------------------"


jorge = User.create(email: "jorge.ruivinho@me.com", password: "password", first_name: "Jorge", last_name: "Ruivinho", pseudo: "Jrui7", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504805315/chx9ggnqbpz9ojb9pjnb.jpg")
renan = User.create(email: "renan.legall@gmail.com", password: "password", first_name: "Renan", last_name: "Legall", pseudo: "TheVoice", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504809025/pfzlmedhzlieyalaczxr.jpg")
thomas = User.create(email: "thomas@birdies.com", password: "password", first_name: "Thomas", last_name: "Caillol", pseudo: "SurfMousse", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505133796/sgb463x8acjlumv7ht86.jpg")

puts "Users created !"
puts "--------------------"



seed_sport  = Seed.create(popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=5AhY_-qUb4w" , secondary_url: "https://www.youtube.com/watch?v=sKeslrZ-i6k", title: "Le tube d'Hendaye", expiration: DateTime.now.utc + 3.days, user_id: thomas.id, category_id: sport.id, description: "Perso Ma Men, c'est les plus grosses vagues que j'ai ridé", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504544452/yxdwojuuq0q71p2oemmz.jpg"])
seed_mode = Seed.create(popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=5AhY_-qUb4w" ,secondary_url: "", title: "T-shirt Psycha", expiration: DateTime.now.utc + 3.days, user_id: thomas.id, category_id: mode.id, description: "Avec ça Men, tu peux même parler boulot après 19h00", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509956287/hdecr3jxijppwsukhi0l.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1509623265/ridfuoa67vz6ewlb3zop.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_loisir = Seed.create(popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=XkA6UAfmJjc" ,secondary_url: "", title: "La balle fusion", expiration: DateTime.now.utc + 2.days, user_id: jorge.id, category_id: loisir.id, description: "Ca file au vent, pénétration idéale", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1504544452/yxdwojuuq0q71p2oemmz.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_beauté = Seed.create(popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=XkA6UAfmJjc" ,secondary_url: "", title: "Pour être beau comme un prince", expiration: DateTime.now.utc + 2.days, user_id: jorge.id, category_id: beauté.id, description: "C'est l'astuce pour transformer n'importe qui en super-model", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509787225/upljdsxonu1c9skxuemd.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_art = Seed.create(popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=KNuUGEahHg8" , secondary_url: "", title: "L'oeuvre d'art des artistes", expiration: DateTime.now.utc + 4.days, user_id: renan.id, category_id: art.id, description: "J'aime bien les chiens, regardez ma photo de profil, et ça c'est un super chien", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1504619657/wmjrhxdqczonc6jbz9g0.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_sorties = Seed.create(popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=VHYUjNh0T1w" ,secondary_url: "", title: "Meilleure table vegan de Los Angeles", expiration: DateTime.now.utc + 4.days, user_id: renan.id, category_id: sorties.id, description: "Avec des plats comme ceux-ci, plus d'excuse pour ne pas tenter de changer son alimentation", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509986837/vegan_xiomv3.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
seed_test = Seed.create(popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=VHYUjNh0T1w" ,secondary_url: "", title: "Test si ça marche", expiration: DateTime.now.utc + 1.minutes, user_id: renan.id, category_id: sorties.id, description: "Avec des plats comme ceux-ci, plus d'excuse pour ne pas tenter de changer son alimentation", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509986837/vegan_xiomv3.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])

puts "Seed created"
puts "----------------------"
