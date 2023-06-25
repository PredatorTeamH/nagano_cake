class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
  @order = Order.new(order_params)
  @order.freight = 800
  @cart_items = current_customer.cart_items
  total_price = @cart_items.sum { |cart_item| cart_item.subtotal * cart_item.quantity }
  @order.total_price = total_price

if params[:order][:select_address] == "0"
  @order.shipping_zip_code = current_customer.zip_code
  @order.shipping_address = current_customer.address
  @order.address_name = current_customer.last_name + current_customer.first_name
elsif params[:order][:select_address] == "1"
  #unless current_customer.orders.exists? # 配送先登録がない場合
     #byebug
    #flash.now[:notice] = "登録済みの住所がありません"
    #render "new"
  #else
    @customer = current_customer
    @address = @customer.shipping_addresses.find(params[:order][:address_id])
    @order.shipping_zip_code = @address.zip_code
    @order.shipping_address = @address.address
    @order.address_name = @address.name
  #end
elsif params[:order][:select_address] == "2"
  if params[:order][:shipping_zip_code].empty? || params[:order][:shipping_address].empty? || params[:order][:address_name].empty?
    flash.now[:notice] = "住所を正しく入力してください"
    render "new"
  else
    @order.shipping_zip_code = params[:order][:shipping_zip_code]
    @order.shipping_address = params[:order][:shipping_address]
    @order.address_name = params[:order][:address_name]
  end
else
  flash.now[:notice] = "住所を選択してください"
  render "new"
end
  end

  def complete
  end

def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      @order_items = OrderItem.create(order_id: @order.id,
                                           item_id: cart_item.item_id,
                                           quantity: cart_item.quantity,
                                           tax_in_price: cart_item.item.price
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
  params.require(:order).permit(:payment_method, :shipping_zip_code, :shipping_address, :address_name, :freight, :total_price, :status)
 end
end
