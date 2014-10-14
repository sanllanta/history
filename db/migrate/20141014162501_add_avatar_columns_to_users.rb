class AddAvatarColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :artworks, :avatar
  end

  def self.down
    remove_attachment :artworks, :avatar
  end
end
