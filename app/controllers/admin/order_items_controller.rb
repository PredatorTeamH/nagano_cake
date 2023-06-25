class Admin::OrderItemsController < ApplicationController
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items

    @order_item.update(order_item_params)
    count = @order_details.completion.count

    if @order_details.count == count
      @order.update(status: :completion)
    elsif @order_item.making?
      @order.update(status: :making)
    end

    flash[:notice] = "製作ステータスを更新しました"
    redirect_to admin_order_path(@order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
