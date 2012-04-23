class Api::Product < Api::Presenter

  def self.find(id)
    new(Product.find(id))
  end
end
