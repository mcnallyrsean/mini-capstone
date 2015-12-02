class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.all
  end

  def create
    carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      )
    redirect_to '/carted_products'
  end
end
