class Label < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_create :ocr_content

  def ocr_image_content
    RTesseract.new(image.current_path, :lang => "pol").to_s
  end

  private

  def ocr_content
    self.content = ocr_image_content
  end
end
