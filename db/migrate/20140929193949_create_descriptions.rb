class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      #Relación de uno a muchos con el modelo artwork
      t.belongs_to :artwork

      t.string :description
      t.timestamps

    end
  end
end
