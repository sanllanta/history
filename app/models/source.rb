class Source < ActiveRecord::Base
  validates_presence_of :name, :message => "Tiene que ingresar un nombre para la fuente"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe una fuente con el mismo nombre" }


  has_many :artworks
end
