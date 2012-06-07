class LabelsController < ApplicationController

  respond_to :json, :xml
  protect_from_forgery :except => :create

  def create
    @label = Label.new
    io = FilelessIO.new(Base64.decode64(params[:image].gsub(" ", "+")))
    io.original_filename = "label.png"
    @label.image = io
    @label.save
    respond_with Api::Label.new(@label).as_json, :location => nil
  end
end
