# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.delete_all
Album.delete_all
AlbumSong.delete_all

a1 = Album.create!(name: 'Black Holes and Revelations', year: Date.new(2006,7,15), image: 'https://upload.wikimedia.org/wikipedia/en/c/c5/BlackHolesCover.jpg')
a2 = Album.create!(name: 'Ta-Dah', year: Date.new(2006, 9, 30), image: 'https://upload.wikimedia.org/wikipedia/en/1/19/Scissor_sisters_-_ta_dah_cover.jpg')
a3 = Album.create!(name: 'Stop the Clocks', year: Date.new(2006, 12, 2), image: 'https://upload.wikimedia.org/wikipedia/en/8/89/Oasis-stoptheclocks.jpg')
a4 = Album.create!(name: 'Origin of Symmetry', year: Date.new(2001,7,17), image: 'https://upload.wikimedia.org/wikipedia/en/3/3a/Museoriginofsymemtryalbumcover.jpg')
a5 = Album.create!(name: 'Hullabaloo', year: Date.new(2002,7,1), image: 'https://upload.wikimedia.org/wikipedia/en/f/fb/Muse_Hullabaloo_CD.jpg')

ar1 = Artist.create!(name: 'Muse')
ar2 = Artist.create!(name: 'Scissor Sisters')
ar3 = Artist.create!(name: 'Oasis')

s1 = Song.create!(title: 'Supermassive Black Hole', artist_id: ar1.id)
s2 = ar2.songs.create!(title: 'I Don\'t Feel Like Dancing') #Alternate method of assignment
s3 = Song.create!(title: 'The Importance of Being Idle', artist_id: ar3.id)
s4 = Song.create!(title: 'Some Might Say', artist_id: ar3.id)
s5 = Song.create!(title: 'Wonderwall', artist_id: ar3.id)

a1.album_songs.create!(song_id: s1.id, track_number: 1)
a2.album_songs.create!(song_id: s2.id, track_number: 1)
a3.album_songs.create!(song_id: s3.id, track_number: 1)
a3.album_songs.create!(song_id: s4.id, track_number: 2)
a3.album_songs.create!(song_id: s5.id, track_number: 3)


puts "Albums: #{Album.count} #{Album.all.pluck(:name)}"
puts "Songs: #{Song.count} #{Song.all.pluck(:title)}"
puts "Artists: #{Artist.count} #{Artist.all.pluck(:name)}"
puts "AlbumSongs: #{AlbumSong.count}"