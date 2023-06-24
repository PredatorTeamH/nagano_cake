class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.order(created_at: :desc)
    @paged_orders = Order.page(params[:page])
  end
end
