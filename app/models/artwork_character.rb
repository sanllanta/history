class ArtworkCharacter < ActiveRecord::Base
  belongs_to :character
  belongs_to :artwork
end
