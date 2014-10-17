class CreateArtworksCharacters < ActiveRecord::Migration
  def change
    create_table :artworks_characters do |t|
      t.belongs_to :artwork
      t.belongs_to :character
    end
  end
end
