class CreateArtworksCategories < ActiveRecord::Migration
  def change
    create_table :artworks_categories do |t|
      t.belongs_to :artwork
      t.belongs_to :category
    end
  end
end
