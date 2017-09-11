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


jorge = User.create(email: "jorge.ruivinho@me.com", password: "password", first_name: "Jorge", last_name: "Ruivinho", pseudo: "Jrui7")
renan = User.create(email: "renan.legall@gmail.com", password: "password", first_name: "Renan", last_name: "Legall", pseudo: "TheVoice")
thomas = User.create(email: "thomas@birdies.com", password: "password", first_name: "Thomas", last_name: "Caillol", pseudo: "SurfMousse")

puts "Users created !"
puts "--------------------"

UserPreference.create(user_id: jorge.id, category_id: mode_homme.id)
UserPreference.create(user_id: jorge.id, category_id: sport.id)
UserPreference.create(user_id: thomas.id, category_id: sport.id)
UserPreference.create(user_id: renan.id, category_id: sorties.id)



puts "Users preferences created !"
puts "--------------------"

