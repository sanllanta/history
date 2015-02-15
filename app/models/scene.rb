class Scene < ActiveRecord::Base

  validates_presence_of :name, :message => "Tiene que ingresar un nombre para la escena"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe una escena con el mismo nombre" }


  has_many :artworks
end
