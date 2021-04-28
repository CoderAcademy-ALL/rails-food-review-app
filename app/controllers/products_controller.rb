class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:edit,:update,:destroy]
  before_action :check_session

  def index
    if params[:query].nil?
      @products = Product.all
    else
      @products = Product.price_less_than(params[:query].to_i)
    end
  end

  def cheap
    @products = Product.cheap
    render :index
  end

  def new
    @product = Product.new
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def create
    @product = Product.create(product_params)
    if @product.valid?
      redirect_to @product
    else
      render :new
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  def show
  end

  def edit
    @brands = Brand.all.map do |brand|
      [brand.name, brand.id]
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :brand_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def check_session
    puts session[:user_id]
    return unless session[:user_id].nil?

    redirect_to users_path
  end
end
