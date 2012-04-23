class IngredientsController < ApplicationController

  respond_to :json, :xml

  def index
    respond_with Api::Collection.new(Ingredient.all, Ingredient)
  end

  def show
    respond_with Api::Ingredient.find(params[:id])
  end
end
