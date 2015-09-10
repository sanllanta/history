class CreateBodyGestures < ActiveRecord::Migration
  def change
    create_table :body_gestures do |t|
    	t.string :name

      t.timestamps
    end
    create_table :artworks_body_gestures do |t|
      t.belongs_to :artwork
      t.belongs_to :body_gesture
    end
  end

end
