class ProductsController < ApplicationController

  respond_to :json, :xml

  def index
    #Api::Collection
  end

  def show
    respond_with Api::Product.find(params[:id])
  end
end
