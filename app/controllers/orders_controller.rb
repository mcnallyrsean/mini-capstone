class OrdersController < ApplicationController

  def index
  end

  def create
    id = current_user.id
    @carted_products = CartedProduct.where("user_id LIKE ? AND status = ?", current_user.id, "carted")


    @subtotal = 0
    @tax = 0
    @carted_products.each do |carted_product|
      carted_product.status = "purchased"
      product_id = carted_product.product.id
      price = carted_product.product.price
      quantity = carted_product.quantity
      @subtotal += price * quantity
      @tax += price * quantity * 0.09
    end

    @total = @subtotal + @tax

    @order = Order.create(
      subtotal: @subtotal,
      tax: @tax,
      total: @total,
      user_id: current_user.id,
      )
    render :index
  end

  def show
  end

end
