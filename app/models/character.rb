class Character < ActiveRecord::Base
  has_many :artwork_characters
  has_many :artworks, dependent: :destroy, :through => :artwork_characters
end
