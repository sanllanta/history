class CreatePassages < ActiveRecord::Migration
  def change
    create_table :passages do |t|
      t.string :name
      t.text :text
      t.string :history_type
      t.string :source
      t.belongs_to :character
      t.timestamps
    end
  end
end
