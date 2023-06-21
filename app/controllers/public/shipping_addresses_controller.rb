class Public::ShippingAddressesController < ApplicationController
  
  def index
    @custormer = current_customer
    @shipping_addresses = current_customer.shipping_addresses
    @shipping_address_new =ShippingAddress.new
  end
  
  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  def create
    @shipping_address_new =ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end
  
  def update
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.delete
    redirect_to shipping_addresses_path
  end
  
end
