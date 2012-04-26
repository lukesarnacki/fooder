class Label < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, ImageUploader
  before_create :content_ocr

  private
  def content_ocr
    self.content = RTesseract.new(self.image_url).to_s
  end
end
