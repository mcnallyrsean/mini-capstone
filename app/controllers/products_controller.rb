class ProductsController < ApplicationController

  def home
  end

  def index
    @products = Product.all

    sort_attribute = params[:input_sort]
    sort_order = params[:input_sort_order]
    if sort_attribute && sort_order
      @products = Product.order(sort_attribute => sort_order)
    end

    discount_attribute = params[:input_sort]
    discount_sort_price = params[:input_price]
    if discount_attribute && discount_sort_price
      @products = Product.where("price < ?", 2)
    end
  end

  def show
    if params[:id] == "random"
      product = Product.all
      @product = product.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
  end

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      deliciousness: params[:deliciousness],
      stocked: params[:stocked],
      quantity: params[:quantity],
      image: params[:image]
      )
    flash[:success] = "Product created. Way to go guy!"
    redirect_to '/products'
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      deliciousness: params[:deliciousness],
      stocked: params[:stocked],
      quantity: params[:quantity],
      image: params[:image]
      )
    flash[:info] = "Product updated. Way to go friend!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy!
    flash[:danger] = "Product eliminated. Way to go buddy!"
    redirect_to '/products'
  end

  def checkout
  end
end
