class Admin::HomesController < ApplicationController
  def top
      @orders = Order.order(id: :desc).page(params[:page]).per(10)
  end
end
