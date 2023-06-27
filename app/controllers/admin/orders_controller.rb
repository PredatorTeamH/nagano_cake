class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    Order.transaction do
      @order.update(order_params)
        if @order.status == "confirm"
          @order_items.update(status: 2)
        end
      end
      redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end

