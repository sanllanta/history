class CreateEngravings < ActiveRecord::Migration
  def change
    create_table :engravings do |t|
      t.text :name

      t.timestamps
    end
  end
end
