class CreatePhylacteryBillboards < ActiveRecord::Migration
  def change
    create_table :phylactery_billboards do |t|
      t.text :name

      t.timestamps
    end
  end
end
