class Public::OrdersController < ApplicationController
  def new 
    @order = Order.new
    #@shipping_addresses = current_customer.shipping_addresses
  end
 
  def confirm
    puts "Confirm action executed"
    @order = Order.new(order_params)
    @order.total_price = 0
    @order.freight = 800
 
  end
 
  def complete
  end
 
def create
  @order = Order.new(order_params)
  if @order.valid?
    redirect_to action: :confirm
  else
    render :new, flash: { error: @order.errors.full_messages }
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
