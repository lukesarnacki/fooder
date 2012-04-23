class Api::Ingredient < Api::Presenter

  def self.find(id)
    new(Ingredient.find(id))
  end

  def self.create!(*args, &block)
    new(Ingredient.create!(*args))
  end
end
