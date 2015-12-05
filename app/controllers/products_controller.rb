class ProductsController < ApplicationController

  def home
  end

  def index

    # calculate_cart_count

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

    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
    render :index
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
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end

  def create
    if current_user && current_user.admin
      @product = Product.new(
        name: params[:name],
        price: params[:price],
        description: params[:description],
        deliciousness: params[:deliciousness],
        stocked: params[:stocked],
        quantity: params[:quantity]
        )
      if @product.save
        flash[:success] = "Product created. Way to go guy!"
        redirect_to '/products'
      else
        render :new
      end
    else
      redirect_to "/"
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render :edit
  end

  def update
    if current_user && current_user.admin
      @product = Product.find_by(id: params[:id])
      if @product.update(
        name: params[:name],
        price: params[:price],
        description: params[:description],
        deliciousness: params[:deliciousness],
        stocked: params[:stocked],
        quantity: params[:quantity]
        )
        flash[:info] = "Product updated. Way to go friend!"
        redirect_to "/products/#{@product.id}"
      else
        render :edit
      end
    else
      render "/product/#{@product.id}/edit"
    end
  end

  def destroy
    if current_user && current_user.admin
      product = Product.find_by(id: params[:id])
      product.destroy!
      flash[:danger] = "Product eliminated. Way to go buddy!"
      redirect_to '/products'
    else
      redirect_to "/"
    end
  end

  def checkout
  end
end
