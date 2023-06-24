class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total_payment = 0
  end

  def create
    item = Item.find(params[:cart_item][:item_id])
    cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: item.id)
    unless cart_item.nil?
      if (params[:cart_item][:quantity]).blank?
        redirect_to item_path(item)
      else
        cart_item.quantity += (params[:cart_item][:quantity]).to_i
        cart_item.save
        redirect_to cart_items_path
      end
    else
      cart_item = current_customer.cart_items.new(cart_item_params)
      if cart_item.save
        redirect_to cart_items_path
      else
        redirect_to item_path(item)
      end
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
