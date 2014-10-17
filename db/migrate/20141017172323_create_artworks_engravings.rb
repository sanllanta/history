class CreateArtworksEngravings < ActiveRecord::Migration
  def change
    create_table :artworks_engravings do |t|
      t.belongs_to :artwork
      t.belongs_to :engraving
    end
  end
end
