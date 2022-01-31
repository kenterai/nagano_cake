module Admin::CustomersHelper
  
 def is_deleted_color(customer)

 if customer.is_deleted == false

 return 'text-success'

 else

 return 'text-secondary'

 end

 end
  
end
