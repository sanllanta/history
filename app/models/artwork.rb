class Artwork < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => {
                        :large => "500x500>",
                        :medium => "300x300>",
                        :small  => "200x200>",
                        :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  belongs_to :passage
  belongs_to :place
  belongs_to :scene
  belongs_to :type
  belongs_to :source
  belongs_to :origin
  belongs_to :scene
  belongs_to :donor
  belongs_to :phylactery_billboard
  belongs_to :story_type
  belongs_to :work_art_symbol
  belongs_to :school
  has_many :iconographic_attributes
  has_many :descriptions
  has_many :artwork_characters, dependent: :destroy
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :artwork_symbols
  has_and_belongs_to_many :engravings
end
