class Character < ActiveRecord::Base
  has_many :artwork_characters, dependent: :destroy
end
