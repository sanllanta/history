class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.string :name_spanish
      t.timestamps
    end
  end
end