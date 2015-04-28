class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.belongs_to :passage
      t.belongs_to :author
      t.belongs_to :scene
      t.belongs_to :type
      t.belongs_to :source
      t.belongs_to :donor
      t.belongs_to :iconographic_attribute
      t.belongs_to :phylactery_billboard
      t.belongs_to :story_type
      t.belongs_to :school
      #t.belongs_to :work_art_symbol

      #Origin and actual cities
      t.belongs_to :origin_city, class_name: "City"
      t.belongs_to :actual_city, class_name: "City"

      #Origin and actual cities
      t.belongs_to :origin_country, class_name: "Country"
      t.belongs_to :actual_country, class_name: "Country"

      #Place where the artwork is at the moment
      t.belongs_to :place

      #Different categories
      t.belongs_to :category_1, class_name: "Category"
      t.belongs_to :category_2, class_name: "Category"
      t.belongs_to :category_3, class_name: "Category"
      t.belongs_to :category_4, class_name: "Category"
      t.belongs_to :category_5, class_name: "Category"

      t.boolean :signed
      t.string :title
      t.string :activity
      t.text :biographic_data
      t.date :creation_date
      t.string :annotation_date
      t.text :synthesis
      t.text :biographic_comment
      t.text :annotation
      t.text :sub_image
      t.text :comment
      t.decimal :latitude_origin , :precision =>10, :scale => 6, :default => 0
      t.decimal :latitude_current , :precision =>10, :scale => 6, :default => 0
      t.decimal :longitude_origin , :precision =>10, :scale => 6, :default => 0
      t.decimal :longitude_current , :precision =>10, :scale => 6, :default => 0
      t.timestamps
    end
  end
end
