class Label < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_create :ocr_content
  before_create :set_ingredient_ids

# def initialize(params, options)
#   img = params[:image]
#   io = FileLessIO.new(Base64.decode64(img))
#   io.original_filename = "label.png"
#
#   self.image = io
# end
  def find_ingredients
    self.content.scan(/\d{3,4}/).map do |number|
      Ingredient.where(["substring(number from '\\d+')::integer = ?", number])
    end.flatten.map(&:id).uniq
  end

  def ocr_image_content
    RTesseract.new(image.current_path, :lang => "pol").to_s
  end

  private

  def set_ingredient_ids
    self.ingredient_ids = find_ingredients
  end

  def ocr_content
    self.content = ocr_image_content
  end
end
