module ApplicationHelper

  def sortable(column, title=nil)
    title ||=column.titleize
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    p direction
    link_to title, {:sort => column, :direction => direction}
  end

  def json_artworks_timeline(obras)
    j = ActiveSupport::JSON
    json_map = obras.map do |u|
      { :date => 'Feb. 18, 2003',
        :display_date => '', :description => 'Brock Savelkoul joins the Army and is stationed at Fort Riley, Kan., in the artillery division.  His assigned position is artillery survey, meaning he prepares terrain for mounting artillery canon.',
        :link => '',
        :series => '',
        :html => 'Brock Savelkoul',
        :timestamp => 1045544400000 }
    end
    json = j.encode(json_map).to_s.html_safe
    p json

  end
end
