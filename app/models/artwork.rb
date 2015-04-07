class Artwork < ActiveRecord::Base

  #validates_presence_of :title, :message => "Tiene que ingresar un titulo"
  #validates_presence_of :category_1, :message => "Tiene que ingresar una categoria"
  #validates_presence_of :author, :message => "Tiene que ingresar un autor"
  #validates_presence_of :place, :message => "Tiene que ingresar un lugar"


  has_attached_file :avatar,
                    :styles => {
                        :large => "500x500>",
                        :medium => "300x300>",
                        :small  => "200x200>",
                        :slider  => "900x300>",
                        :thumb => "100x100>" },
                    :default_url => ":style/missing.png"

  has_attached_file :sub_image,
                    :styles => {
                        :large => "500x500>",
                        :medium => "300x300>",
                        :small  => "200x200>",
                        :slider  => "900x300>",
                        :thumb => "100x100>" },
                    :default_url => ":style/missing.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  validates_attachment_content_type :sub_image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]


  belongs_to :passage
  belongs_to :author
  belongs_to :scene
  belongs_to :type
  belongs_to :source
  belongs_to :donor
  belongs_to :story_type
  belongs_to :work_art_symbol
  belongs_to :school

  #origin and actual cities
  belongs_to :origin_city, class_name: "City"
  belongs_to :actual_city, class_name: "City"

  #origin and actual countries
  belongs_to :origin_country, class_name: "Country"
  belongs_to :actual_country, class_name: "Country"

  #Different categories
  belongs_to :category_1, class_name: "Category"
  belongs_to :category_2, class_name: "Category"
  belongs_to :category_3, class_name: "Category"
  belongs_to :category_4, class_name: "Category"
  belongs_to :category_5, class_name: "Category"


  has_many :phylactery_billboards
  has_many :iconographic_attributes

  has_many :artwork_characters
  has_many :characters, :through => :artwork_characters


  has_and_belongs_to_many :artwork_symbols
  has_and_belongs_to_many :descriptions
  has_and_belongs_to_many :engravings

  accepts_nested_attributes_for :artwork_symbols, allow_destroy: true
  accepts_nested_attributes_for :descriptions, :reject_if => lambda{ |a| a[:description].blank? }, allow_destroy: true
  accepts_nested_attributes_for :iconographic_attributes, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :artwork_symbols, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :engravings, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :donor, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :passage, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :phylactery_billboards, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :scene, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :scene, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :school, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :source, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :story_type, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :type, :reject_if => lambda{ |a| a[:name].blank? }, allow_destroy: true

  def self.b_title(search)
    if not search.to_s.empty?
      where( 'title LIKE ?', "%#{search}%")
    else
      nil
    end
  end

  def self.s_descriptions(search)
    if not search.to_s.empty?
      joins('LEFT JOIN descriptions ON descriptions.artwork_id = artworks.id ').where( 'description LIKE ?', "%#{search}%")
    else
      nil
    end
  end

  def self.b_synthesis(search)
    if not search.to_s.empty?
      where( 'synthesis LIKE ?', "%#{search}%")
    else
      nil
    end
  end

  def self.b_country(search)
    if not search.to_s.empty?
      joins('LEFT JOIN countries ON countries.id = artworks.country_id').where( 'countries.name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.b_category_1(search)
    if not search.to_s.empty?
      joins('LEFT JOIN categories ON category_1_id = categories.id').where( 'categories.name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.b_category_2(search)
    if not search.to_s.empty?
      joins('LEFT JOIN categories ON category_2_id = categories.id').where( 'categories.name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.b_category_3(search)
    if not search.to_s.empty?
      joins('LEFT JOIN categories ON category_3_id = categories.id').where( 'categories.name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.b_category_4(search)
    if not search.to_s.empty?
      joins('LEFT JOIN categories ON category_4_id = categories.id').where( 'categories.name LIKE ?', "%#{search}%")
    else
      all
    end
  end
  def self.b_category_5(search)
    if not search.to_s.empty?
      joins('LEFT JOIN categories ON category_5_id = categories.id').where( 'categories.name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.b_comment(search)
    if not search.to_s.empty?
      where( 'comment LIKE ?', "%#{search}%")
    else
      nil
    end
  end

  def self.b_scene(search)
    if not search.to_s.empty?
      joins('LEFT JOIN scenes ON scenes.id = artworks.scene_id').where( 'scenes.name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.b_story_types(search)
    if not search.to_s.empty?
      joins('LEFT JOIN story_types ON story_types.id = artworks.story_type_id').where( 'story_types.name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.b_author(search)
    if not search.to_s.empty?
      joins('LEFT JOIN authors ON authors.id = artworks.author_id').where( 'authors.name LIKE ?', "%#{search}%")
    else
      nil
    end
  end

  def self.search_author(search)
    if search
      where('author_id = ?', search)
    else
      all
    end
  end

  def self.search_category(search)
    if search
      where('category_1_id = ?', search)
    else
      all
    end
  end

  def self.search_country(search)
    if search
      where('country_id = ?', search)
    else
      all
    end
  end

  def get_title
    title ? title : "N/A"
  end

  def get_author_name
    author && author.name ? author.name : "N/A"
  end

  def get_activity
    activity ? activity : "N/A"
  end

  def get_biographic_data
    biographic_data ? biographic_data : "N/A"
  end

  def get_signed
    signed ? "Si" : "No"
  end

  def get_category_1_name
    category_1 && category_1.name ? category_1.name : "N/A"
  end

  def get_category_2_name
    category_2 && category_2.name ? category_2.name : "N/A"
  end

  def get_category_3_name
    category_3 && category_3.name ? category_3.name : "N/A"
  end

  def get_category_4_name
    category_4 && category_4.name ? category_4.name : "N/A"
  end

  def get_category_5_name
    category_5 && category_5.name ? category_5.name : "N/A"
  end

  def get_type_name
    type && type.name ? type.name : "N/A"
  end

  def get_source_name
    source && source.name ? source.name : "N/A"
  end

  def get_origin_country_name
    origin_country && origin_country.name ? origin_country.name : "N/A"
  end

  def get_actual_country_name
    actual_country && actual_country.name ? actual_country.name : "N/A"
  end

  def get_origin_city_name
    origin_city && origin_city.name ? origin_city.name : "N/A"
  end

  def get_actual_city_name
    actual_city && actual_city.name ? actual_city.name : "N/A"
  end



  def get_school_name
    school && school.name ? school.name : "N/A"
  end

  def get_synthesis
    synthesis ? synthesis : "N/A"
  end

  def get_biographic_comment
    biographic_comment ? biographic_comment : "N/A"
  end

  def get_scene_name
    scene && scene.name ? scene.name : "N/A"
  end

  def get_story_type_name
    story_type && story_type.name ? story_type.name : "N/A"
  end

  def get_donor_name
    donor && donor.name ? donor.name : "N/A"
  end

  def get_phylactery_billboard_name
    phylactery_billboards && phylactery_billboards.name ? phylactery_billboards.name : "N/A"
  end

  def get_iconographic_attribute_name
    iconographic_attributes && iconographic_attributes.name ? iconographic_attributes.name : "N/A"
  end

  def get_comment
    comment ? comment : "N/A"
  end

end

