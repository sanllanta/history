class Passage < ActiveRecord::Base
  has_many :artworks


  def get_history_type
    history_type ? history_type : "N/A"
  end


end
