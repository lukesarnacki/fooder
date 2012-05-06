class IngredientsController < ApplicationController

  respond_to :json, :xml

  def index
    respond_with Api::Collection.new(Ingredient.all, Api::Ingredient).as_json
  end

  def show
    respond_with Api::Ingredient.find(params[:id]).as_json
  end
end
