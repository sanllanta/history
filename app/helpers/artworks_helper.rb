module ArtworksHelper
  def link_to_add_description(name,f,association)
    new_obj = ff.objects.send(association).klass.new
    id = new_obj.object.object_id
    field = f.fields_for(association,new_obj,child_index:id)do |builder|
      render(association.to_s.singularize + "_fields", f:builder)
    end
    link_to(name, "#",class: "add_fields",data:{id: id, fields: fields.gsub("\n","")})
  end
end
