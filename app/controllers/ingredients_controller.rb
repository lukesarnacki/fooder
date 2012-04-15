class IngredientsController < ApplicationController

  respond_to :json, :xml

  def index
  end

  def show
    respond_with Api::Ingredient.find(params[:id])
  end
end
