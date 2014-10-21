class CreateArtworksSymbols < ActiveRecord::Migration
  def change
    create_table :artwork_symbols_artworks do |t|
      t.belongs_to :artwork
      t.belongs_to :artwork_symbol
    end
  end
end
