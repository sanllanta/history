class CreateArtworksDescriptions < ActiveRecord::Migration
  def change
    create_table :artworks_descriptions do |t|
      t.belongs_to :artwork
      t.belongs_to :description
    end
  end
end
