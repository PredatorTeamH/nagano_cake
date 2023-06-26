class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer =Customer.find(params[:id])
  end

  def edit
    @customer =Customer.find(params[:id])
  end

  def update
    @customer =Customer.find(params[:id])
    if @customer.update(admin_customer_params)
      flash[:notice] = "登録情報を更新しました"
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  private
  def admin_customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana_name,
    :first_kana_name, :zip_code, :address, :phone_number, :email, :is_active)
  end

end
