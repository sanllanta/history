class StoryType < ActiveRecord::Base
  validates_presence_of :name, :message => "Tiene que ingresar un nombre para el tipo de historia"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe un tipo de historia con el mismo nombre" }


  has_many :artworks
end
