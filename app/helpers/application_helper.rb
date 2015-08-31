module ApplicationHelper

  def sortable(column, title=nil)
    title ||=column.titleize
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    p direction
    link_to title, {:sort => column, :direction => direction}
  end
end
