class Category < ActiveRecord::Base
	#Ancestry for tree like behavior
	has_ancestry
  	has_many :artworks
end
