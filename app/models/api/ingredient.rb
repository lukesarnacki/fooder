class Api::Ingredient < Api::Presenter

  def self.find(id)
    new(Ingredient.find(id))
  end

  def self.create!(*args, &block)
    new(Ingredient.create!(*args))
  end

  def as_json(*)
    {
      :id => id,
      :number => number,
      :name => name,
      :grade => grade,
      :description => description,
      :products_type => products_type,
      :origin => origin,
      :daily_intake => daily_intake,
      :dietary_restrictions => dietary_restrictions,
      :products => products.as_json(:only => [:id, :name, :company_name])
    }
  end
end
