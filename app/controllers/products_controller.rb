class ProductsController < ApplicationController

  respond_to :json, :xml

  def index
    respond_with Api::Collection.new(Product.all, Api::Product).as_json
  end

  def show
    respond_with Api::Product.find(params[:id])
  end

  def create
    product = Api::Product.create!(params[:product])
    respond_with product
  end
end
