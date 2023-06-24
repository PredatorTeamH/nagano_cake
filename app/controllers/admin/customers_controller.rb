class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customers.all
  end
  
  def show
    @customer =Customer.find(params[:id])
  end
  
  def edit
    @customer =Customer.find(params[:id])
  end
  
  def update
    @customer =Customer.find(params[:id])
    if customer.update
      redirect_to customers_path
    else
      render 'edit'
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana_name,
    :first_kana_name, :zip_code, :address, :phone_number, :email)
  end
end
