class Category < ActiveRecord::Base

  validates_presence_of :name, :message => "Tiene que ingresar un nombre"
  validates :name, uniqueness: { case_sensitive: false , message: "Ya existe el nombre" }

  #Ancestry for tree like behavior
	has_ancestry
  	has_many :artworks
end
