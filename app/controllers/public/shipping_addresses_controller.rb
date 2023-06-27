class Public::ShippingAddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address_new =ShippingAddress.new
    @custormer = current_customer
    @addresses = current_customer.shipping_addresses
  end

  def create
    @address_new =ShippingAddress.new(shipping_address_params)
    # 足りなかった部分
    @address_new.customer_id = current_customer.id
    if @address_new.save
      flash[:notice]= "新しい配送先を登録しました"
      redirect_to shipping_addresses_path
    else
      @addresses = current_customer.shipping_addresses
      render :index
    end
  end

  def edit
    @address = ShippingAddress.find(params[:id])
  end

  def update
    @address = ShippingAddress.find(params[:id])
    if @address.update(shipping_address_params)
      flash[:notice]= "配送先を更新しました"
      redirect_to shipping_addresses_path
    else
      flash[:notice]= "更新に失敗しました"
      render "edit"
    end
      
  end

  def destroy
    @address = ShippingAddress.find(params[:id])
    @address.delete
    redirect_to shipping_addresses_path
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:zip_code, :address, :name)
  end

end
