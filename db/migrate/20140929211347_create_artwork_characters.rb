class CreateArtworkCharacters < ActiveRecord::Migration
  def change
    create_table :artwork_characters, id: false do |t|
      t.belongs_to :artwork, index: true
      t.belongs_to :character, index: true
      t.boolean :principal_character, :default => false
      t.timestamps
    end
  end
end
