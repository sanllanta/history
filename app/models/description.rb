class Description < ActiveRecord::Base
  validates_uniqueness_of :description, :message => "El descriptor ya existe."
  has_and_belongs_to_many :artworks

end