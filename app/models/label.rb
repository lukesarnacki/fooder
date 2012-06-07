class Label < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_create :ocr_content

# def initialize(params, options)
#   img = params[:image]
#   io = FileLessIO.new(Base64.decode64(img))
#   io.original_filename = "label.png"
#
#   self.image = io
# end

  def ocr_image_content
    RTesseract.new(image.current_path, :lang => "pol").to_s
  end

  private

  def ocr_content
    self.content = ocr_image_content
  end
end
