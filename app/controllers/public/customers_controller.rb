class Public::CustomersController < ApplicationController
  
  def show
    # 顧客マイページを表示
    @customer = current_customer
  end
  
  def edit
    # 顧客情報編集ページを表示
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "会員情報を更新しました。"
      redirect_to customer_path(current_customer)
    else
      render "edit"
    end
  end
  
  def unsubscribe
    # 顧客を特定する処理
    @customer = current_customer
    # 退会確認画面を表示するための処理
    render "unsubscibe"
  end
  
  def withdraw
    @customer = current_customer
    if @customer.update(status: 'not_active')
      # 退会が成功した場合の処理
      # 例えば、成功メッセージを表示したり、リダイレクトしたりする
      flash[:success] = '退会処理が完了しました。'
      redirect_to root_path
    else
      # 退会が失敗した場合の処理
      # 例えば、エラーメッセージを表示したり、再度退会画面を表示したりする
      flash.now[:error] = '退会処理に失敗しました。'
      render  "unsubscribe" # 退会確認画面を再表示
    end
  end
    
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana_name,
    :first_kana_name, :zip_code, :address, :phone_number, :email)
  end
end
