# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Category.destroy_all

mode_homme = Category.create(name: "Mode homme")
mode_femme = Category.create(name: "Mode femme")
musique = Category.create(name: "Musique")
sorties = Category.create(name: "Sorties")
sport = Category.create(name: "Sport")
categories = ["Mode homme", "Mode femme", "Musique", "Sorties", "Sport" ]
puts "Categories created !"
puts "--------------------"


jorge = User.create(email: "jorge.ruivinho@me.com", password: "password")
renan = User.create(email: "renan.legall@gmail.com", password: "password")
thomas = User.create(email: "thomas@birdies.com", password: "password")

puts "Users created !"
puts "--------------------"
