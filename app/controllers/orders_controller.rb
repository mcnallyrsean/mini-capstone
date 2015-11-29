class OrdersController < ApplicationController

  def index
  end

  def create
    order = Order.create(
      quantity: params[:quantity],
      product_id: params[:product_id],
      user_id: current_user.id,
      # item_price: Order.last.item_price,
      tax: Order.last.sales_tax,
      subtotal: Order.last.subtotal,
      total: Order.last.grand_total
      )
    # flash[:success] = "Added to cart. Way to go guy!"
    @order_quantity = Order.last.quantity
    @order_id = Order.last.id
    # @order_price = Order.last.item_price
    @order_sales_tax = Order.last.sales_tax
    @order_subtotal = Order.last.subtotal
    @order_grand_total = Order.last.grand_total
    render :index
  end

  def show
  end

end
