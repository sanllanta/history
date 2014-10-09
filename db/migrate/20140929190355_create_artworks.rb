class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :author
      t.string :activity
      t.text :biographic_data
      t.text :signed
      t.text :synthesis
      t.text :biographic_comment
      t.text :annotation
      t.text :sub_image
      t.text :comment

      t.belongs_to :category
      t.timestamps
    end
  end
end
