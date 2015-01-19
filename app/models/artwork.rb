class
Artwork < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => {
                        :large => "500x500>",
                        :medium => "300x300>",
                        :small  => "200x200>",
                        :slider  => "900x300>",
                        :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]

  belongs_to :passage
  belongs_to :place
  belongs_to :scene
  belongs_to :type
  belongs_to :source
  belongs_to :origin
  belongs_to :donor
  belongs_to :phylactery_billboard
  belongs_to :story_type
  belongs_to :work_art_symbol
  belongs_to :school

  has_many :iconographic_attributes
  has_many :descriptions, dependent: :destroy
  has_many :artwork_characters

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :artwork_symbols
  has_and_belongs_to_many :engravings

  accepts_nested_attributes_for :descriptions, :reject_if => lambda{ |a| a[:description].blank? }, allow_destroy: true
  accepts_nested_attributes_for :iconographic_attributes, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :artwork_symbols, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :engravings, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :donor, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :origin, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :passage, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :phylactery_billboard, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :scene, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :place, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :scene, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :school, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :source, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :story_type, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :type, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true

end
