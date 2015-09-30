class Guest < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :hotels, through: :reviews
end
