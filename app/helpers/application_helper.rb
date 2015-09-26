module ApplicationHelper

  def sortable(column, title=nil)
    title ||=column.titleize
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    p direction
    link_to title, {:sort => column, :direction => direction}
  end

  def json_artworks_timeline(obras)
    j = ActiveSupport::JSON
    json_map = obras.map do |o|
      if o.creation_date
      { :date => o.creation_date,
        :display_date => '', 
        :description => o.biographic_comment,
        :link => url_for(o),
        :series => '',
        :html => 'HTML?',
        :timestamp => o.creation_date }
      elsif{

      }
      end
    end
    json = j.encode(json_map).to_s.html_safe
    p json

  end
end
