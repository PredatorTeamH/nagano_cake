class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
  #誤ったデータをデーターベースへ書き込まないための処理を行う
  OrderItem.transaction do
    @order_item.update(order_item_params)
    #制作ステータスが作成中の時
    if @order_item.status == "making"
      #注文ステータスが作成中に変更される
      @order.update(status: 2)
      #注文詳細の商品種数 = 注文種数の全ての制作ステータス数が制作完了になったら
    elsif @order.order_items.count == @order.order_items.where(status: "completion").count
      #注文ステータスが発送準備中に変更になる
       @order.update(status: 3)
    end
  end
    redirect_to admin_order_path(@order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end
end
