class Type < ActiveRecord::Base
  validates_presence_of :name, :message => "Tiene que ingresar un nombre para el tipo"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe un tipo con el mismo nombre" }

  has_many :artworks
end
