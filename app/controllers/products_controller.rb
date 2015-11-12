class ProductsController < ApplicationController

  def home
  end

  def all
    @products = Product.all
  end
end
