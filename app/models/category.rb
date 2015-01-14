class Category < ActiveRecord::Base
	#Ancestry for tree like behavior
	has_ancestry
  has_and_belongs_to_many :artworks
end
