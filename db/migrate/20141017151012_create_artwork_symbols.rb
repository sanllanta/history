class CreateArtworkSymbols < ActiveRecord::Migration
  def change
    create_table :artwork_symbols do |t|
      t.string :name
      t.timestamps
    end
  end
end
