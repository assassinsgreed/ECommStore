class StoreController < ApplicationController
  def index
    @products = Product.includes(:reviews)
  end

  def show
    @product = Product.includes(:reviews).find(params[:id])
  end
end
