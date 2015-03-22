class CreatePhylacteryBillboards < ActiveRecord::Migration
  def change
    create_table :phylactery_billboards do |t|
      t.text :name
      t.belongs_to :artwork
      t.timestamps
    end
  end
end
