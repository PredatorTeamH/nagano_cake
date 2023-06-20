class Public::OrdersController < ApplicationController

 def new 
  @order = Order.new
 end
 
 def confirm
 
 end
 
 def complete
 end
 
 def create
 end
 
 def index
  @orders = Order
 end 
 
 def show

 end
 
end
