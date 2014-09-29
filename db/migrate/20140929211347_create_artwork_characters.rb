class CreateArtworkCharacters < ActiveRecord::Migration
  def change
    create_table :artwork_characters, id: false do |t|
      t.integer :artwork
      t.integer :character
      t.boolean :principal_character, :default => false
      t.timestamps
    end
  end
end
