class OrdersController < ApplicationController

  def index
  end

  def create
   if current_user 
    @carted_products = current_user.carted_products.where(status: "carted")
    order = Order.create(user_id: current_user.id)
    @carted_products.update_all(status: "purchased", order_id: order.id)
    order.calculate_totals
    redirect_to "/orders/#{order.id}"
  else
    redirect_to "/users/sign_up" 
  end  


  def show
    if current_user
      @order = Order.find_by(id: params[:id])
    else
      redirect_to "/users/sign_up"
  end

end
