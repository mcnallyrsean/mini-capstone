class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.all
    if @carted_products.blank?
      flash[:info] = "You haven't added anything to your cart yet buddy!"
      redirect_to '/products'
    else
      @carted_products
    end
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
