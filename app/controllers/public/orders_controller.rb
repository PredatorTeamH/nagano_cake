class Public::OrdersController < ApplicationController
  def new 
    @order = Order.new
    #@shipping_addresses = current_customer.shipping_addresses
  end
 
  def confirm
  @order = Order.new(order_params)
  @order.freight = 800
  @cart_items = current_customer.cart_items
  total_price = @cart_items.sum { |cart_item| cart_item.item.price * cart_item.quantity }
  @order.total_price = total_price + @order.freight
  case params[:order][:shipping_address]
  when "address"
    @order.shipping_address = "ご自身の住所"
  when "select_address"
    @order.shipping_address = "登録住所からの選択"
  when "new_address"
    @order.shipping_address = "新しいお届け先"
    @order.shipping_zip_code = params[:order][:shipping_zip_code]
    @order.shipping_address = params[:order][:shipping_address]
    @order.address_name = params[:order][:address_name]
  end
  end
 
  def complete
  end
 
def create
  @order = Order.new(order_params)
 puts @order.inspect
    if @order.save
   redirect_to order_path(@order)
    else
    render :new
    end
end
 
  def index
    @orders = Order.all
  end 
 
  def show
    @order = Order.find(params[:id])
  end
 
  private

 def order_params
  params.require(:order).permit(:payment_method, :shipping_zip_code, :shipping_address, :address_name, :freight, :total_price)
 end
end
