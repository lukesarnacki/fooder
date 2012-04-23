class Api::Product < Api::Presenter

  def self.find(id)
    new(Product.find(id))
  end

  def self.create!(*args, &block)
    new(Product.create!(*args))
  end
end
