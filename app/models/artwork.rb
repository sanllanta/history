class Artwork < ActiveRecord::Base
  belongs_to :category
  belongs_to :passage
  belongs_to :place
  belongs_to :scene
  belongs_to :type
  belongs_to :source
  belongs_to :origin
  belongs_to :scene
  belongs_to :donor
  belongs_to :phylactery_billboard
  has_many :descriptions
  has_many :artwork_characters, dependent: :destroy
  belongs_to :story_type
  belongs_to :work_art_symbol
  belongs_to :school
  has_attached_file :avatar,
                    :styles => {
                        :large => "500x500>",
                        :medium => "300x300>",
                        :small  => "200x200>",
                        :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  #do_not_validate_attachment_file_type :avatar
end
