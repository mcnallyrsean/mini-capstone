class ProductsController < ApplicationController

  def home
  end

  def index
    @products = Product.all
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def new
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      deliciousness: params[:deliciousness]
      )
    redirect_to '/products'
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      deliciousness: params[:deliciousness]
      )
    redirect_to "/products/#{@product.id}"
  end

  def checkout
  end
end
