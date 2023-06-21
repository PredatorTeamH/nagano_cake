class Public::OrdersController < ApplicationController
  def new 
    @order = Order.new
   session[:selected_customer_id] = current_customer.id
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
       @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_items = OrderItems.create(order_id: @order.id,
                                           item_id: cart_item.item_id,
                                           quantity: cart_item.quantity,
                                           )
      end
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render "confirm"
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
