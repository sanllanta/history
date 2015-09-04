class Character < ActiveRecord::Base
  has_many :artwork_characters
  has_many :artworks, dependent: :destroy, :through => :artwork_characters


  def get_name
    name ? name : "N/A"
  end

  def get_death_date
    death_date ? death_date : "N/A"
  end

  def get_beatification_date
    beatification_date ? beatification_date : "N/A"
  end

  def get_canonization_date
    canonization_date ? canonization_date : "N/A"
  end

  def get_biography
    biography ? biography : "N/A"
  end

  def get_is_principal
    artwork_characters.first.principal_character ? 'Si' : 'No'
  end
end
