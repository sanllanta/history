class Origin < ActiveRecord::Base

  validates_presence_of :name, :message => "Tiene que ingresar un nombre para el origen"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe un origen con el mismo nombre" }


  has_many :artworks
end
