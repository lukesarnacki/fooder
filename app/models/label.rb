class Label < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_create :content_ocr

  private

  def content_ocr
    self.content = RTesseract.new(image.current_path, :lang => "pol")
  end
end
