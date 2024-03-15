class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render json: @products, status: 200
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      render json: @product, status: 200
    else
      render json: { error: "Product creation failed!" }
    end
  end

  def update
    if @product
      @product.update(product_params)
      render json: { product: @product, message: "Product updated successfully!" }, status: 200
    else
      render json: { error: "Product updateion failed!" }
    end
  end

  def show
    if @product
      render json: @product, status: 200
    else
      render json: { error: "Product not found" }
    end
  end

  def destroy
    if @product
      @product.destroy
      render json: { message: "Product destroyed successfully!" }, status: 200
    else
      render json: { error: "Product deletion failed!" }
    end
  end

  private

  def product_params
    params.require(:product).permit([:name, :brand, :price, :description])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
