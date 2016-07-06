module ApplicationHelper
	def page_entries_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'item' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No #{entry_name.pluralize} found"
    else; "Showing all #{entry_name.pluralize}"
    end
  else
    %{Showing %d of %d #{entry_name.pluralize}} % [
      collection.offset + collection.length,
      collection.total_entries
    ]
  end
end

end
