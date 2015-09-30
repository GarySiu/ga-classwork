# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
h1 = Hotel.create(name: 'GA London Palace', city: 'London')
h2 = Hotel.create(name: 'GA Miami Palace', city: 'Miami')
h3 = Hotel.create(name: 'GA Milan Palace', city: 'Milan')
h4 = Hotel.create(name: 'GA Toronto Palace', city: 'Toronto')
h5 = Hotel.create(name: 'GA Paris Palace', city: 'Paris')

g1 = Guest.create(name: 'Barry Grape', age: 57)
g2 = Guest.create(name: 'Henry Duffenberg', age: 23)
g3 = Guest.create(name: 'Roger Tollington', age: 30)
g4 = Guest.create(name: 'Nigella Appelbury', age: 76)
g5 = Guest.create(name: 'Isabella Diaz-Cortez', age: 44)

h1.reviews.create(content: 'Fantastic!', rating: 5, guest: g1)
h1.reviews.create(content: 'Noisy Neighbours. Shocking', rating: 1, guest: g2)
h2.reviews.create(content: 'zaaaazaaaazaaaa', rating: 5, guest: g3)
h4.reviews.create(content: 'where am i?', rating: 3, guest: g4)
h4.reviews.create(content: 'who am i?', rating: 1, guest: g5)

puts "Seeded! With #{Hotel.all.count} Hotels"