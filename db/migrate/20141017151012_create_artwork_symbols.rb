class CreateArtworkSymbols < ActiveRecord::Migration
  def change
    create_table :artwork_symbols do |t|
      t.text :name
      t.timestamps
    end
  end
end
