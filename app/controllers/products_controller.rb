class ProductsController < ApplicationController

  def home
  end

  def all
    @products = Product.all
  end

  def checkout
  end
end
