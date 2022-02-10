class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order_detail_making_status_is_in_production?(order_detail)
    order = order_detail.order
    order_detail_making_status_is_production_complete?(order)
    redirect_to admin_order_path(order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

  def order_detail_making_status_is_in_production?(order_detail)
    if order_detail.making_status_before_type_cast == 2
      order_detail.order.update(status: 2)
    end
  end

  def order_detail_making_status_is_production_complete?(order)
    if order.order_details.all? do |order_detail|
      order_detail.making_status_before_type_cast == 3
       end
      order.update(status: 3)
    end
  end

end
