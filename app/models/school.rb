class School < ActiveRecord::Base

  validates_presence_of :name, :message => "Tiene que ingresar un nombre para la escuela"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe una escuela con el mismo nombre" }


  has_many :artworks
end
