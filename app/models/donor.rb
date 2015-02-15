class Donor < ActiveRecord::Base

  validates_presence_of :name, :message => "Tiene que ingresar un nombre para el donador"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe un donador con el mismo nombre" }


  has_many :artworks
end
