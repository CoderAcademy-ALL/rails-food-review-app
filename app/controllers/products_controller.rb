class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:edit,:update,:destroy]

  def index
    @products = Product.all
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
end
