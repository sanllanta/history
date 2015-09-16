class BodyGesture < ActiveRecord::Base

  validates_uniqueness_of :name, :message => "El gesto ya existe."

  has_and_belongs_to_many :artworks

end