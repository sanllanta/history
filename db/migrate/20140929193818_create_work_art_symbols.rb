class CreateWorkArtSymbols < ActiveRecord::Migration
  def change
    create_table :work_art_symbols do |t|
      t.string :name

      t.timestamps
    end
  end
end
