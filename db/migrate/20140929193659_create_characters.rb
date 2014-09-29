class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :biography
      t.date :death_date
      t.date :beatification_date
      t.date :canonization_date

      t.timestamps
    end
  end
end
