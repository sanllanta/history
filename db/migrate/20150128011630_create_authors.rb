class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :lastname
      t.text :biography
      t.text :activity
      t.timestamps
    end
  end
end