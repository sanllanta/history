class CreateArtworkCharacters < ActiveRecord::Migration
  def change
    create_table :artwork_characters, id: false do |t|
      t.belongs_to :artwork
      t.belongs_to :character
      t.boolean :principal_character, :default => false
      t.timestamps
    end
  end
end
