module Admin::ItemsHelper
  
 def is_active_color(item)

 if item.is_active == true

 return 'text-success'

 else

 return 'text-secondary'

 end

 end
  
end
