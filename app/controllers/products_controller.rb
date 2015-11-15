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
  end

  def checkout
  end
end
