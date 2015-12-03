class CartedProductsController < ApplicationController

  def index
    if current_user && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      flash[:info] = "You haven't added anything to your cart yet buddy!"
      redirect_to '/products'
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

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product successfully removed! Order something else though..."
    redirect_to "/carted_products"
  end
end
