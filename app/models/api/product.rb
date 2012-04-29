class Api::Product < Api::Presenter

  def self.find(id)
    new(Product.find(id)).as_json
  end

  def self.create!(*args, &block)
    new(Product.create!(*args))
  end

  def as_json(*)
    {
      :id => id,
      :name => name,
      :description => description,
      :company_name => company.name
    } 
  end
end
