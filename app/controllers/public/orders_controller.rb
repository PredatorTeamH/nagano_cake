class Public::OrdersController < ApplicationController

 def new 
  @order = Order.new
 end
 
 def confirm
  @order = Order.new(order_params)
  if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      unless current_customer.addresses.exists?
        flash.now[:notice] = "登録済みの住所がありません"
        render "new"
      else
        @address = Address.find(params[:order][:address_id])
        @order.zip_code = @address.zip_code
        @order.address = @address.address
        @order.name = @address.name
      end
    elsif params[:order][:select_address] == "2"
      if ( params[:order][:zip_code] || params[:order][:address] || params[:order][:name] ).empty?
        flash.now[:notice] = "住所を正しく入力してください"
        render "new"
      else
        @order.zip_code = params[:order][:zip_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
    else
      flash.now[:notice] = "住所を選択してください"
      render "new"
     end
  
 end
 
 def complete
 end
 
 def create
 end
 
 def index
  @orders = Order
 end 
 
 def show

 end
  private

    def order_params
      params.require(:order).permit(:payment_method,:zip_code,:address,:name,:freight,:total_peice)
    end

 
end
