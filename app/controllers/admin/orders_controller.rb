class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

  def update
    order = Order.find(params[:id])
    order.update(customer_params)
    order_status_is_deposited?(order)
    redirect_to admin_order_path(order.id)
  end

  private

  def customer_params
    params.require(:order).permit(:status)
  end

  def order_status_is_deposited?(order)
    if order.status_before_type_cast == 1
      order.order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end
    end
  end

end
