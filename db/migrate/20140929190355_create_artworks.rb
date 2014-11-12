class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.belongs_to :passage
      t.belongs_to :place
      t.belongs_to :scene
      t.belongs_to :type
      t.belongs_to :source
      t.belongs_to :origin
      t.belongs_to :donor
      t.belongs_to :phylactery_billboard
      t.belongs_to :story_type
      t.belongs_to :school
      #t.belongs_to :work_art_symbol

      t.string :author
      t.string :activity
      t.text :biographic_data
      t.text :signed
      t.text :synthesis
      t.text :biographic_comment
      t.text :annotation
      t.text :sub_image
      t.text :comment
      t.decimal :latitude_origin , :precision =>5, :scale => 2, :default => 0
      t.decimal :latitude_current , :precision =>5, :scale => 2, :default => 0
      t.decimal :longitude_origin , :precision =>5, :scale => 2, :default => 0
      t.decimal :longitude_current , :precision =>5, :scale => 2, :default => 0
      t.timestamps
    end
  end
end
