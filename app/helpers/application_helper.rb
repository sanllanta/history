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
        {
          :date => o.creation_date,
          :display_date => o.creation_date,
          :description => o.biographic_comment,
          :link => url_for(o),
          :series => '',
          :html => o.title,
          :timestamp => o.creation_date.to_time.to_i
        }
      end
    end
    p json_map.compact.count
    p json_map.compact.count
    p json_map.compact.count
    p json_map.compact.count
    json = j.encode(json_map.compact).to_s.html_safe
    json
  end

  def json_artworks_timeline_total(obras)
    j = ActiveSupport::JSON
    json_map = obras.map do |o|
      if o.creation_date
        {
            :date => o.creation_date,
            :display_date => o.creation_date,
            :description => o.biographic_comment,
            :link => url_for(o),
            :series => '',
            :html => o.title,
            :timestamp => o.creation_date.to_time.to_i
        }
      end
    end
    json_map.compact.count
  end

end
