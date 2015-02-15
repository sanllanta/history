class ArtworkSymbol < ActiveRecord::Base

  validates_presence_of :name, :message => "Tiene que ingresar un nombre para el símbolo"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe un símbolo con el mismo nombre" }

  has_and_belongs_to_many :artworks
end