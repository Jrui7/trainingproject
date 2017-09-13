# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Category.destroy_all
UserPreference.destroy_all

mode_homme = Category.create(name: "Mode homme")
mode_femme = Category.create(name: "Mode femme")
musique = Category.create(name: "Musique")
sorties = Category.create(name: "Sorties")
sport = Category.create(name: "Sport")
categories = ["Mode homme", "Mode femme", "Musique", "Sorties", "Sport" ]
puts "Categories created !"
puts "--------------------"


jorge = User.create(email: "jorge.ruivinho@me.com", password: "password", first_name: "Jorge", last_name: "Ruivinho", pseudo: "Jrui7", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504805315/chx9ggnqbpz9ojb9pjnb.jpg", preferences: [])
renan = User.create(email: "renan.legall@gmail.com", password: "password", first_name: "Renan", last_name: "Legall", pseudo: "TheVoice", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504809025/pfzlmedhzlieyalaczxr.jpg", preferences: [])
thomas = User.create(email: "thomas@birdies.com", password: "password", first_name: "Thomas", last_name: "Caillol", pseudo: "SurfMousse", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505133796/sgb463x8acjlumv7ht86.jpg", preferences: [])

puts "Users created !"
puts "--------------------"

UserPreference.create(user_id: jorge.id, category_id: mode_homme.id)
UserPreference.create(user_id: jorge.id, category_id: sport.id)
UserPreference.create(user_id: thomas.id, category_id: sport.id)
UserPreference.create(user_id: renan.id, category_id: sorties.id)



puts "Users preferences created !"
puts "--------------------"


Seed.create(title: "Le tube d'Hendaye", user_id: thomas.id, category_id: sport.id, description: "Perso Ma Men, c'est les plus grosses vagues que j'ai ridé", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg"])
Seed.create(title: "La balle fusion", user_id: jorge.id, category_id: sport.id, description: "Ca file au vent, pénétration idéale", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1504544452/yxdwojuuq0q71p2oemmz.jpg"])
Seed.create(title: "L'oeuvre d'art des artistes", user_id: renan.id, category_id: sorties.id, description: "J'aime bien les chiens, regardez ma photo de profil, et ça c'est un super chien", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1504619657/wmjrhxdqczonc6jbz9g0.jpg"])


