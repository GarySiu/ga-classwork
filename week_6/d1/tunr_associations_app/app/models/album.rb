class Album < ActiveRecord::Base
  mount_uploader :image, AlbumUploader
  has_many :album_songs
  has_many :songs, through: :album_songs, dependent: :destroy
end
